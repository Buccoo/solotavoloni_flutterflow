import '/backend/backend.dart';
import '/components/poster_carousel/poster_carousel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page_view_with_video_model.dart';
export 'page_view_with_video_model.dart';

class PageViewWithVideoWidget extends StatefulWidget {
  const PageViewWithVideoWidget({super.key});

  @override
  _PageViewWithVideoWidgetState createState() =>
      _PageViewWithVideoWidgetState();
}

class _PageViewWithVideoWidgetState extends State<PageViewWithVideoWidget> {
  late PageViewWithVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageViewWithVideoModel());

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

    return Visibility(
      visible: false,
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
              child: PageView(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            if (isWeb)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Cromie-1.png',
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.9,
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
                              child: const Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
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
                            List<EventsRecord>
                                cromieEventsListEventsRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  cromieEventsListEventsRecordList.length,
                                  (cromieEventsListIndex) {
                                final cromieEventsListEventsRecord =
                                    cromieEventsListEventsRecordList[
                                        cromieEventsListIndex];
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
                                            cromieEventsListEventsRecord,
                                            ParamType.Document,
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
                                          'Key58t_${cromieEventsListIndex}_of_${cromieEventsListEventsRecordList.length}'),
                                      parameter4: cromieEventsListEventsRecord,
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
                  SingleChildScrollView(
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
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.9,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                  SingleChildScrollView(
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
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.9,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              fontFamily: 'Readex Pro',
                                              fontSize: 25.0,
                                            ),
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
                                          'eventParam':
                                              cDMEventListEventsRecord,
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
                                          'Key4zd_${cDMEventListIndex}_of_${cDMEventListEventsRecordList.length}'),
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
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                child: smooth_page_indicator.SmoothPageIndicator(
                  controller: _model.pageViewController ??=
                      PageController(initialPage: 0),
                  count: 3,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (i) async {
                    await _model.pageViewController!.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  effect: smooth_page_indicator.ExpandingDotsEffect(
                    expansionFactor: 3.0,
                    spacing: 8.0,
                    radius: 16.0,
                    dotWidth: 16.0,
                    dotHeight: 8.0,
                    dotColor: FlutterFlowTheme.of(context).accent1,
                    activeDotColor: FlutterFlowTheme.of(context).primary,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
