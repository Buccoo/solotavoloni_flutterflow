import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/components/poster_carousel/poster_carousel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'event_details_model.dart';
export 'event_details_model.dart';

class EventDetailsWidget extends StatefulWidget {
  const EventDetailsWidget({
    super.key,
    required this.eventParam,
  });

  final EventsRecord? eventParam;

  @override
  _EventDetailsWidgetState createState() => _EventDetailsWidgetState();
}

class _EventDetailsWidgetState extends State<EventDetailsWidget> {
  late EventDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: const Icon(
                          Icons.home,
                          color: Color(0xFF333A42),
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('Home');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.posterCarouselModel,
                      updateCallback: () => setState(() {}),
                      child: PosterCarouselWidget(
                        parameter4: widget.eventParam,
                      ),
                    ),
                  ),
                  if (widget.eventParam?.location == 'Cromie')
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: FutureBuilder<List<AreasRecord>>(
                                future: queryAreasRecordOnce(
                                  parent: widget.eventParam?.reference,
                                  queryBuilder: (areasRecord) =>
                                      areasRecord.orderBy('areaName'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<AreasRecord> carouselAreasRecordList =
                                      snapshot.data!;
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 100.0,
                                    child: CarouselSlider.builder(
                                      itemCount: carouselAreasRecordList.length,
                                      itemBuilder: (context, carouselIndex, _) {
                                        final carouselAreasRecord =
                                            carouselAreasRecordList[
                                                carouselIndex];
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Colors.transparent,
                                            elevation: 12.0,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (loggedIn) {
                                                  context.pushNamed(
                                                    'TablesArea',
                                                    queryParameters: {
                                                      'areaDoc': serializeParam(
                                                        carouselAreasRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'areaDoc':
                                                          carouselAreasRecord,
                                                    },
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Devi essere registrato per continuare.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 1500),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      action: SnackBarAction(
                                                        label:
                                                            'Torna all\'inizio',
                                                        onPressed: () async {
                                                          context.goNamed(
                                                            'OnBoarding',
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  const TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                              ),
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                }

                                                await _model.carouselController
                                                    ?.animateToPage(
                                                  4,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Text(
                                                carouselAreasRecord.displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                      options: CarouselOptions(
                                        initialPage: min(1,
                                            carouselAreasRecordList.length - 1),
                                        viewportFraction: 0.4,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.25,
                                        enableInfiniteScroll: false,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 376.0,
                              height: 670.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/cromie.png',
                                  ).image,
                                ),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                              child: Opacity(
                                opacity: 0.1,
                                child: StreamBuilder<List<AreasRecord>>(
                                  stream: queryAreasRecord(
                                    parent: widget.eventParam?.reference,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<AreasRecord> cromieMapAreasRecordList =
                                        snapshot.data!;
                                    return SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: custom_widgets.CromieMap(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        bgColor: valueOrDefault<Color>(
                                          widget.eventParam?.bgColor,
                                          FlutterFlowTheme.of(context).accent1,
                                        ),
                                        franoipasserella: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'franoipasserella')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'franoipasserella')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            4,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        franoi: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'franoi')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'franoi')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            2,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        franoiopen: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'franoi')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'franoi')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            3,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        consolle: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'consolle')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'consolle')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            0,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        martinilounge: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'martinilounge')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'martinilounge')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            5,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        mioopen: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'martinilounge')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'martinilounge')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            7,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        mioring: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'martinilounge')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'martinilounge')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            8,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        miobasso: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'miobasso')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'miobasso')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            6,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        tuobasso: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'tuobasso')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'tuobasso')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            9,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        tuoring: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'tuoring')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'tuoring')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            10,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        tuoopen: () async {
                                          if (loggedIn) {
                                            await _model.carouselController
                                                ?.animateToPage(
                                              10,
                                              duration:
                                                  const Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            10,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        dongio: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'TablesArea',
                                              queryParameters: {
                                                'areaDoc': serializeParam(
                                                  cromieMapAreasRecordList
                                                      .where((e) =>
                                                          e.areaName ==
                                                          'dongio')
                                                      .toList()
                                                      .first,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'areaDoc':
                                                    cromieMapAreasRecordList
                                                        .where((e) =>
                                                            e.areaName ==
                                                            'dongio')
                                                        .toList()
                                                        .first,
                                              },
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Devi essere registrato per continuare.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                action: SnackBarAction(
                                                  label: 'Torna all\'inizio',
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      'OnBoarding',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          }

                                          await _model.carouselController
                                              ?.animateToPage(
                                            1,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
