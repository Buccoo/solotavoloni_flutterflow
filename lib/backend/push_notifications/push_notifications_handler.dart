import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/logo512.png',
              height: MediaQuery.sizeOf(context).height * 0.5,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'OnBoarding': ParameterData.none(),
  'Login_Email': ParameterData.none(),
  'Signup_Email': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'Home': ParameterData.none(),
  'UserSettings': ParameterData.none(),
  'PRList': ParameterData.none(),
  'UserProfile': ParameterData.none(),
  'AddEvent': ParameterData.none(),
  'AdminSettings': ParameterData.none(),
  'EditEvent': (data) async => ParameterData(
        allParams: {
          'eventParam': await getDocumentParameter<EventsRecord>(
              data, 'eventParam', EventsRecord.fromSnapshot),
        },
      ),
  'EventsList': ParameterData.none(),
  'EventDetails': (data) async => ParameterData(
        allParams: {
          'eventParam': await getDocumentParameter<EventsRecord>(
              data, 'eventParam', EventsRecord.fromSnapshot),
          'indexPoster': getParameter<int>(data, 'indexPoster'),
        },
      ),
  'TablesArea': (data) async => ParameterData(
        allParams: {
          'areaDoc': await getDocumentParameter<AreasRecord>(
              data, 'areaDoc', AreasRecord.fromSnapshot),
        },
      ),
  'Login_Phone': ParameterData.none(),
  'ClientList': ParameterData.none(),
  'Signup_Phone': ParameterData.none(),
  'VerifyCode': (data) async => ParameterData(
        allParams: {
          'phoneNumber': getParameter<String>(data, 'phoneNumber'),
        },
      ),
  'CreateNotification': ParameterData.none(),
  'UpdateNotification': ParameterData.none(),
  'TablesBooked': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
