import '/backend/backend.dart';
import '/components/poster_carousel/poster_carousel_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'swipeable_stack_with_video_model.dart';
export 'swipeable_stack_with_video_model.dart';

class SwipeableStackWithVideoWidget extends StatefulWidget {
  const SwipeableStackWithVideoWidget({super.key});

  @override
  _SwipeableStackWithVideoWidgetState createState() =>
      _SwipeableStackWithVideoWidgetState();
}

class _SwipeableStackWithVideoWidgetState
    extends State<SwipeableStackWithVideoWidget> {
  late SwipeableStackWithVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableStackWithVideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowSwipeableStack(
      onSwipeFn: (index) {},
      onLeftSwipe: (index) {},
      onRightSwipe: (index) {},
      onUpSwipe: (index) {},
      onDownSwipe: (index) {},
      itemBuilder: (context, index) {
        return [
          () => Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          if (isWeb)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Cromie-1.png',
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.9,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (!isWeb)
                            const Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowVideoPlayer(
                                path: 'assets/videos/Cromie_1.mp4',
                                videoType: VideoType.asset,
                                autoPlay: true,
                                looping: true,
                                showControls: false,
                                allowFullScreen: false,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 80.0, 0.0, 0.0),
                                  child: Text(
                                    'CROMIE',
                                    style: TextStyle(
                                      fontFamily: 'Cromie',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 35.0,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/swipeup_nobg.gif',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<List<EventsRecord>>(
                        stream: queryEventsRecord(
                          queryBuilder: (eventsRecord) => eventsRecord
                              .where(
                                'location',
                                isEqualTo: 'Cromie',
                              )
                              .orderBy('date'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).tertiary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<EventsRecord> cromieEventsListEventsRecordList =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                cromieEventsListEventsRecordList.length,
                                (cromieEventsListIndex) {
                              final cromieEventsListEventsRecord =
                                  cromieEventsListEventsRecordList[
                                      cromieEventsListIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'EventDetails',
                                    queryParameters: {
                                      'eventParam': serializeParam(
                                        cromieEventsListEventsRecord,
                                        ParamType.Document,
                                      ),
                                      'indexPoster': serializeParam(
                                        0,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'eventParam':
                                          cromieEventsListEventsRecord,
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                      ),
                                    },
                                  );
                                },
                                child: PosterCarouselWidget(
                                  key: Key(
                                      'Keyfxw_${cromieEventsListIndex}_of_${cromieEventsListEventsRecordList.length}'),
                                  parameter4: cromieEventsListEventsRecord,
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
          () => Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          if (isWeb)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Clorophilla-1.png',
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.9,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (!isWeb)
                            const FlutterFlowVideoPlayer(
                              path: 'assets/videos/Clorophilla_1.mp4',
                              videoType: VideoType.asset,
                              autoPlay: true,
                              looping: true,
                              showControls: false,
                              allowFullScreen: false,
                              allowPlaybackSpeedMenu: false,
                            ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/clorophilla.png',
                                    width: double.infinity,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/swipeup_nobg.gif',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 50.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Prossimamente...',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 25.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          () => Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          if (isWeb)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/CDMBackgroundFoto.png',
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.9,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (!isWeb)
                            const Align(
                              alignment: AlignmentDirectional(0.0, -0.12),
                              child: FlutterFlowVideoPlayer(
                                path: 'assets/videos/backgroundVideo.mp4',
                                videoType: VideoType.asset,
                                autoPlay: true,
                                looping: true,
                                showControls: false,
                                allowFullScreen: false,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 80.0, 0.0, 0.0),
                                    child: Text(
                                      'Il Caffè del Mare',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Petit Formal Script',
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/swipeup_nobg.gif',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<List<EventsRecord>>(
                        stream: queryEventsRecord(
                          queryBuilder: (eventsRecord) => eventsRecord
                              .where(
                                'location',
                                isEqualTo: 'CDM',
                              )
                              .orderBy('date'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).tertiary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<EventsRecord> cDMEventListEventsRecordList =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                cDMEventListEventsRecordList.length,
                                (cDMEventListIndex) {
                              final cDMEventListEventsRecord =
                                  cDMEventListEventsRecordList[
                                      cDMEventListIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'EventDetails',
                                      queryParameters: {
                                        'eventParam': serializeParam(
                                          cDMEventListEventsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'eventParam': cDMEventListEventsRecord,
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                        ),
                                      },
                                    );
                                  },
                                  child: PosterCarouselWidget(
                                    key: Key(
                                        'Key2yp_${cDMEventListIndex}_of_${cDMEventListEventsRecordList.length}'),
                                    parameter4: cDMEventListEventsRecord,
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
        ][index]();
      },
      itemCount: 3,
      controller: _model.swipeableStackController,
      loop: true,
      cardDisplayCount: 1,
      scale: 1.0,
    );
  }
}
