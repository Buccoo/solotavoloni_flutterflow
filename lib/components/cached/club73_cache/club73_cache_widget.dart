import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/poster_carousel/poster_carousel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'club73_cache_model.dart';
export 'club73_cache_model.dart';

class Club73CacheWidget extends StatefulWidget {
  const Club73CacheWidget({super.key});

  @override
  _Club73CacheWidgetState createState() => _Club73CacheWidgetState();
}

class _Club73CacheWidgetState extends State<Club73CacheWidget> {
  late Club73CacheModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Club73CacheModel());

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
                    'assets/images/club73_imageBG.jpg',
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
              if (!isWeb)
                const FlutterFlowVideoPlayer(
                  path: 'assets/videos/club73_BG.mp4',
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/2vqf7_',
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: 150.0,
                          fit: BoxFit.cover,
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
            child: StreamBuilder<List<EventsRecord>>(
              stream: queryEventsRecord(
                queryBuilder: (eventsRecord) => eventsRecord
                    .where(
                      'location',
                      isEqualTo: 'Club73',
                    )
                    .where(
                      'date',
                      isGreaterThanOrEqualTo: getCurrentTimestamp,
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
                List<EventsRecord> club73EventsListEventsRecordList =
                    snapshot.data!;
                if (club73EventsListEventsRecordList.isEmpty) {
                  return const Center(
                    child: EmptyListWidget(),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(club73EventsListEventsRecordList.length,
                          (club73EventsListIndex) {
                    final club73EventsListEventsRecord =
                        club73EventsListEventsRecordList[club73EventsListIndex];
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
                                club73EventsListEventsRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'eventParam': club73EventsListEventsRecord,
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                              ),
                            },
                          );
                        },
                        child: PosterCarouselWidget(
                          key: Key(
                              'Keywmp_${club73EventsListIndex}_of_${club73EventsListEventsRecordList.length}'),
                          parameter4: club73EventsListEventsRecord,
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
