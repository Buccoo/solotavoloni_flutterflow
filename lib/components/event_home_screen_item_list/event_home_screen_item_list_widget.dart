import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'event_home_screen_item_list_model.dart';
export 'event_home_screen_item_list_model.dart';

class EventHomeScreenItemListWidget extends StatefulWidget {
  const EventHomeScreenItemListWidget({
    super.key,
    this.parameter4,
  });

  final EventsRecord? parameter4;

  @override
  _EventHomeScreenItemListWidgetState createState() =>
      _EventHomeScreenItemListWidgetState();
}

class _EventHomeScreenItemListWidgetState
    extends State<EventHomeScreenItemListWidget> {
  late EventHomeScreenItemListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventHomeScreenItemListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
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
                widget.parameter4,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'eventParam': widget.parameter4,
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.bottomToTop,
              ),
            },
          );
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  final imgUrls = widget.parameter4?.imgPaths
                          .map((e) => e)
                          .toList()
                          .toList() ??
                      [];
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).width,
                    child: CarouselSlider.builder(
                      itemCount: imgUrls.length,
                      itemBuilder: (context, imgUrlsIndex, _) {
                        final imgUrlsItem = imgUrls[imgUrlsIndex];
                        return Hero(
                          tag: imgUrlsItem,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 200),
                              fadeOutDuration: const Duration(milliseconds: 200),
                              imageUrl: imgUrlsItem,
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                      carouselController: _model.carouselController ??=
                          CarouselController(),
                      options: CarouselOptions(
                        initialPage: min(1, imgUrls.length - 1),
                        viewportFraction: 1.0,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayInterval: const Duration(milliseconds: (800 + 6000)),
                        autoPlayCurve: Curves.linear,
                        pauseAutoPlayInFiniteScroll: false,
                        onPageChanged: (index, _) =>
                            _model.carouselCurrentIndex = index,
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 16.0, 4.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                      child: Text(
                        dateTimeFormat('MMMMEEEEd', widget.parameter4!.date!),
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
