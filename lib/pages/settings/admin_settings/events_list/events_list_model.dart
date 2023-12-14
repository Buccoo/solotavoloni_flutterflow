import '/flutter_flow/flutter_flow_util.dart';
import 'events_list_widget.dart' show EventsListWidget;
import 'package:flutter/material.dart';

class EventsListModel extends FlutterFlowModel<EventsListWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
