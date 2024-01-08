import '/backend/backend.dart';
import '/components/poster_carousel/poster_carousel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'c_d_m_cache_model.dart';
export 'c_d_m_cache_model.dart';

class CDMCacheWidget extends StatefulWidget {
  const CDMCacheWidget({super.key});

  @override
  _CDMCacheWidgetState createState() => _CDMCacheWidgetState();
}

class _CDMCacheWidgetState extends State<CDMCacheWidget> {
  late CDMCacheModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CDMCacheModel());

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

    return SingleChildScrollView(
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
                    path: 'assets/videos/VideoCDM.mp4',
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                        child: Text(
                          'Il Caffè del Mare',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 25.0,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
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
              List<EventsRecord> cDMEventListEventsRecordList = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(cDMEventListEventsRecordList.length,
                    (cDMEventListIndex) {
                  final cDMEventListEventsRecord =
                      cDMEventListEventsRecordList[cDMEventListIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
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
                              transitionType: PageTransitionType.bottomToTop,
                            ),
                          },
                        );
                      },
                      child: PosterCarouselWidget(
                        key: Key(
                            'Keybam_${cDMEventListIndex}_of_${cDMEventListEventsRecordList.length}'),
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
    );
  }
}
