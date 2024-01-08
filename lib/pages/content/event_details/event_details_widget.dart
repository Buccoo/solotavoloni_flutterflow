import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/components/poster_carousel/poster_carousel_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'event_details_model.dart';
export 'event_details_model.dart';

class EventDetailsWidget extends StatefulWidget {
  const EventDetailsWidget({
    super.key,
    required this.eventParam,
    int? indexPoster,
  })  : indexPoster = indexPoster ?? 0;

  final EventsRecord? eventParam;
  final int indexPoster;

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

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context).tertiary,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    dateTimeFormat(
                                      'd/M/y',
                                      widget.eventParam!.date!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.eventParam!.guests.isNotEmpty)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Ospiti della serata',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final guestsList =
                                        widget.eventParam?.guests.toList() ??
                                            [];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(guestsList.length,
                                          (guestsListIndex) {
                                        final guestsListItem =
                                            guestsList[guestsListIndex];
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: valueOrDefault<Color>(
                                            widget.eventParam?.bgColor,
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              guestsListItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        );
                                      }).divide(const SizedBox(width: 10.0)),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Text(
                                  widget.eventParam?.location == 'Cromie'
                                      ? 'Scorri le varie zone'
                                      : 'Accedi alla lista dei tavoli:',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                      height: 120.0,
                                      child: CarouselSlider.builder(
                                        itemCount:
                                            carouselAreasRecordList.length,
                                        itemBuilder:
                                            (context, carouselIndex, _) {
                                          final carouselAreasRecord =
                                              carouselAreasRecordList[
                                                  carouselIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: badges.Badge(
                                                  badgeContent: Text(
                                                    carouselAreasRecord
                                                        .tablesList.length
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                        ),
                                                  ),
                                                  showBadge: carouselAreasRecord
                                                          .tablesList.isNotEmpty,
                                                  shape:
                                                      badges.BadgeShape.circle,
                                                  badgeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  elevation: 4.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  position: badges.BadgePosition
                                                      .topEnd(),
                                                  animationType: badges
                                                      .BadgeAnimationType.scale,
                                                  toAnimate: true,
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
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
                                                        if (loggedIn) {
                                                          context.pushNamed(
                                                            'TablesArea',
                                                            queryParameters: {
                                                              'areaDoc':
                                                                  serializeParam(
                                                                carouselAreasRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'areaDoc':
                                                                  carouselAreasRecord,
                                                            },
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Devi essere registrato per continuare.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      1500),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                              action:
                                                                  SnackBarAction(
                                                                label:
                                                                    'Torna all\'inizio',
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .goNamed(
                                                                    'OnBoarding',
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          const TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        await _model
                                                            .carouselController
                                                            ?.animateToPage(
                                                          4,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                carouselAreasRecord
                                                                    .displayName,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Cromie',
                                                                      fontSize:
                                                                          17.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              if (carouselAreasRecord
                                                                  .available)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(4.0),
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.man_4,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                carouselAreasRecord.manPrice.toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(4.0),
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.woman,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                carouselAreasRecord.womanPrice.toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              if (!carouselAreasRecord
                                                                  .available)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(4.0),
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              const Icon(
                                                                                Icons.not_interested,
                                                                                color: Color(0xFF952424),
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                'Non disponibile',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: const Color(0xFF952424),
                                                                                    ),
                                                                              ),
                                                                            ].divide(const SizedBox(width: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                            ].divide(const SizedBox(
                                                                height: 0.5)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        carouselController:
                                            _model.carouselController ??=
                                                CarouselController(),
                                        options: CarouselOptions(
                                          initialPage: min(
                                              0,
                                              carouselAreasRecordList.length -
                                                  1),
                                          viewportFraction: 0.6,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.2,
                                          enableInfiniteScroll: false,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: false,
                                          onPageChanged: (index, _) async {
                                            _model.carouselCurrentIndex = index;
                                            setState(() {
                                              _model.areaSelected =
                                                  _model.carouselCurrentIndex;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (widget.eventParam?.location == 'Cromie')
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 1.0),
                                      child: Text(
                                        'oppure',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 1.0),
                                      child: Text(
                                        'Seleziona un\'area della mappa',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                              SizedBox(
                                width: 376.0,
                                height: 670.0,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/cromie.png',
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.2,
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<AreasRecord>
                                              cromieMapAreasRecordList =
                                              snapshot.data!;
                                          return SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: custom_widgets.CromieMap(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              bgColor: valueOrDefault<Color>(
                                                widget.eventParam?.bgColor,
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                              ),
                                              current:
                                                  _model.carouselCurrentIndex,
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
                                                      .clearSnackBars();
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
                                                      .clearSnackBars();
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
                                                  2,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                                'franoiopen')
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
                                                                  'franoiopen')
                                                              .toList()
                                                              .first,
                                                    },
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
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
                                                  3,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                      .clearSnackBars();
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
                                                  0,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                      .clearSnackBars();
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
                                                  5,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                                'mioopen')
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
                                                                  'mioopen')
                                                              .toList()
                                                              .first,
                                                    },
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
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
                                                  7,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                                'mioring')
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
                                                                  'mioring')
                                                              .toList()
                                                              .first,
                                                    },
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
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
                                                  8,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                      .clearSnackBars();
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
                                                  6,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                      .clearSnackBars();
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
                                                  9,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                      .clearSnackBars();
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
                                                  10,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              tuoopen: () async {
                                                if (loggedIn) {
                                                  context.pushNamed(
                                                    'TablesArea',
                                                    queryParameters: {
                                                      'areaDoc': serializeParam(
                                                        cromieMapAreasRecordList
                                                            .where((e) =>
                                                                e.areaName ==
                                                                'tuoopen')
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
                                                                  'tuoopen')
                                                              .toList()
                                                              .first,
                                                    },
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
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
                                                  10,
                                                  duration: const Duration(
                                                      milliseconds: 500),
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
                                                      .clearSnackBars();
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
                                                  1,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        if (widget.eventParam?.hasMapPosition() ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Come raggiungerci?\n',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Visibility(
                                    visible: !isWeb,
                                    child: Builder(builder: (context) {
                                      final googleMapMarker =
                                          widget.eventParam;
                                      return FlutterFlowGoogleMap(
                                        controller: _model.googleMapsController,
                                        onCameraIdle: (latLng) =>
                                            _model.googleMapsCenter = latLng,
                                        initialLocation:
                                            _model.googleMapsCenter ??=
                                                widget.eventParam!.mapPosition!,
                                        markers: [
                                          if (googleMapMarker != null)
                                            FlutterFlowMarker(
                                              googleMapMarker.reference.path,
                                              googleMapMarker.mapPosition!,
                                              () async {
                                                await launchMap(
                                                  location: widget
                                                      .eventParam?.mapPosition,
                                                  title: widget
                                                      .eventParam!.location,
                                                );
                                              },
                                            ),
                                        ],
                                        markerColor: GoogleMarkerColor.violet,
                                        mapType: MapType.satellite,
                                        style: GoogleMapStyle.standard,
                                        initialZoom: 14.0,
                                        allowInteraction: false,
                                        allowZoom: false,
                                        showZoomControls: false,
                                        showLocation: false,
                                        showCompass: false,
                                        showMapToolbar: false,
                                        showTraffic: false,
                                        centerMapOnMarkerTap: true,
                                      );
                                    }),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
