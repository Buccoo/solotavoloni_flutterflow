import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/poster_carousel/poster_carousel_widget.dart';
import '/components/tutorials/tutorial_home/tutorial_home_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if (valueOrDefault<bool>(currentUserDocument?.tutorial, false)) {
          await showDialog(
            barrierColor: const Color(0xE514181B),
            context: context,
            builder: (dialogContext) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: const TutorialHomeWidget(),
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));
        }
        if (isiOS) {
          if (getRemoteConfigBool('show_update_modal')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Nuovo aggiornamento disponibile!',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                action: SnackBarAction(
                  label: 'Aggiorna',
                  onPressed: () async {
                    await launchURL(
                        'https://apps.apple.com/it/app/solo-tavoloni/id6474373211');
                  },
                ),
              ),
            );
          } else {
            return;
          }

          return;
        } else {
          if (isAndroid) {
            if (getRemoteConfigBool('show_update_modal')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Nuovo aggiornamento disponibile!',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
            } else {
              return;
            }

            return;
          } else {
            return;
          }
        }
      }
    });

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

    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
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
                                              Image.network(
                                                'https://firebasestorage.googleapis.com/v0/b/solotavoloni.appspot.com/o/media%2FCromie_ImageBG.png?alt=media&token=1e3214b8-4c3e-491b-8d03-c72107090155',
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.9,
                                                fit: BoxFit.cover,
                                              ),
                                            if (!isWeb)
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowVideoPlayer(
                                                  path:
                                                      'assets/videos/Cromie_1.mp4',
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
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 80.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'CROMIE',
                                                      style: TextStyle(
                                                        fontFamily: 'Cromie',
                                                        color:
                                                            Color(0xFFDAD7D7),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 35.0,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 50.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child:
                                              StreamBuilder<List<EventsRecord>>(
                                            stream: queryEventsRecord(
                                              queryBuilder: (eventsRecord) =>
                                                  eventsRecord
                                                      .where(
                                                        'location',
                                                        isEqualTo: 'Cromie',
                                                      )
                                                      .where(
                                                        'date',
                                                        isGreaterThanOrEqualTo:
                                                            getCurrentTimestamp,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<EventsRecord>
                                                  cromieEventsListEventsRecordList =
                                                  snapshot.data!;
                                              if (cromieEventsListEventsRecordList
                                                  .isEmpty) {
                                                return const Center(
                                                  child: EmptyListWidget(),
                                                );
                                              }
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    cromieEventsListEventsRecordList
                                                        .length,
                                                    (cromieEventsListIndex) {
                                                  final cromieEventsListEventsRecord =
                                                      cromieEventsListEventsRecordList[
                                                          cromieEventsListIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'EventDetails',
                                                          queryParameters: {
                                                            'eventParam':
                                                                serializeParam(
                                                              cromieEventsListEventsRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'eventParam':
                                                                cromieEventsListEventsRecord,
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child:
                                                          PosterCarouselWidget(
                                                        key: Key(
                                                            'Keyeth_${cromieEventsListIndex}_of_${cromieEventsListEventsRecordList.length}'),
                                                        parameter4:
                                                            cromieEventsListEventsRecord,
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
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          children: [
                                            if (isWeb)
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: const Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: const Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      'https://firebasestorage.googleapis.com/v0/b/solotavoloni.appspot.com/o/media%2FClorophilla_ImageBG.png?alt=media&token=03c8d04a-b8d5-4e55-b4d2-3fab370406ff',
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if (!isWeb)
                                              const FlutterFlowVideoPlayer(
                                                path:
                                                    'assets/videos/Clorophilla_1.mp4',
                                                videoType: VideoType.asset,
                                                autoPlay: true,
                                                looping: true,
                                                showControls: false,
                                                allowFullScreen: false,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          'https://firebasestorage.googleapis.com/v0/b/solotavoloni.appspot.com/o/media%2FClorophilla_LogoEsteso.png?alt=media&token=ae0ae0ad-f2d3-40ca-9413-d7c8f800a131',
                                                      width: double.infinity,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 50.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child:
                                              StreamBuilder<List<EventsRecord>>(
                                            stream: queryEventsRecord(
                                              queryBuilder: (eventsRecord) =>
                                                  eventsRecord
                                                      .where(
                                                        'location',
                                                        isEqualTo:
                                                            'Clorophilla',
                                                      )
                                                      .where(
                                                        'date',
                                                        isGreaterThanOrEqualTo:
                                                            getCurrentTimestamp,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<EventsRecord>
                                                  clorophillaEventsListEventsRecordList =
                                                  snapshot.data!;
                                              if (clorophillaEventsListEventsRecordList
                                                  .isEmpty) {
                                                return const Center(
                                                  child: EmptyListWidget(),
                                                );
                                              }
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    clorophillaEventsListEventsRecordList
                                                        .length,
                                                    (clorophillaEventsListIndex) {
                                                  final clorophillaEventsListEventsRecord =
                                                      clorophillaEventsListEventsRecordList[
                                                          clorophillaEventsListIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'EventDetails',
                                                          queryParameters: {
                                                            'eventParam':
                                                                serializeParam(
                                                              clorophillaEventsListEventsRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'eventParam':
                                                                clorophillaEventsListEventsRecord,
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child:
                                                          PosterCarouselWidget(
                                                        key: Key(
                                                            'Key2dd_${clorophillaEventsListIndex}_of_${clorophillaEventsListEventsRecordList.length}'),
                                                        parameter4:
                                                            clorophillaEventsListEventsRecord,
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
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          children: [
                                            if (isWeb)
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: const Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: const Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      'https://firebasestorage.googleapis.com/v0/b/solotavoloni.appspot.com/o/media%2FLeucaspide_%E2%80%ABImageBG.jpg?alt=media&token=ddf0de41-07be-4544-ad3f-d50761a47c8c',
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if (!isWeb)
                                              const FlutterFlowVideoPlayer(
                                                path:
                                                    'https://firebasestorage.googleapis.com/v0/b/solotavoloni.appspot.com/o/media%2FLeucaspide_VideoBG.mp4?alt=media&token=9aae59f1-1454-4526-b6b8-5804e3287b11',
                                                videoType: VideoType.network,
                                                autoPlay: true,
                                                looping: true,
                                                showControls: false,
                                                allowFullScreen: false,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 40.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            'https://firebasestorage.googleapis.com/v0/b/solotavoloni.appspot.com/o/media%2FLeucaspide_LogoEsteso.png?alt=media&token=f68d42e5-ca5d-448c-aedd-227ff536b843',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 150.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 50.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child:
                                              StreamBuilder<List<EventsRecord>>(
                                            stream: queryEventsRecord(
                                              queryBuilder: (eventsRecord) =>
                                                  eventsRecord
                                                      .where(
                                                        'location',
                                                        isEqualTo:
                                                            'M. Leucaspide',
                                                      )
                                                      .where(
                                                        'date',
                                                        isGreaterThanOrEqualTo:
                                                            getCurrentTimestamp,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<EventsRecord>
                                                  leucaspideEventsListEventsRecordList =
                                                  snapshot.data!;
                                              if (leucaspideEventsListEventsRecordList
                                                  .isEmpty) {
                                                return const Center(
                                                  child: EmptyListWidget(),
                                                );
                                              }
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    leucaspideEventsListEventsRecordList
                                                        .length,
                                                    (leucaspideEventsListIndex) {
                                                  final leucaspideEventsListEventsRecord =
                                                      leucaspideEventsListEventsRecordList[
                                                          leucaspideEventsListIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'EventDetails',
                                                          queryParameters: {
                                                            'eventParam':
                                                                serializeParam(
                                                              leucaspideEventsListEventsRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'eventParam':
                                                                leucaspideEventsListEventsRecord,
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child:
                                                          PosterCarouselWidget(
                                                        key: Key(
                                                            'Key3j0_${leucaspideEventsListIndex}_of_${leucaspideEventsListEventsRecordList.length}'),
                                                        parameter4:
                                                            leucaspideEventsListEventsRecord,
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
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 16.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  count: 3,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 3.0,
                                    spacing: 8.0,
                                    radius: 16.0,
                                    dotWidth: 16.0,
                                    dotHeight: 8.0,
                                    dotColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!loggedIn)
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 20.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: const Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.goNamed(
                                  'OnBoarding',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      if (loggedIn)
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 20.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.settings_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(
                                  'UserSettings',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
