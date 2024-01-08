import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_details_carosuel_model.dart';
export 'event_details_carosuel_model.dart';

class EventDetailsCarosuelWidget extends StatefulWidget {
  const EventDetailsCarosuelWidget({
    super.key,
    this.parameter4,
  });

  final EventsRecord? parameter4;

  @override
  _EventDetailsCarosuelWidgetState createState() =>
      _EventDetailsCarosuelWidgetState();
}

class _EventDetailsCarosuelWidgetState
    extends State<EventDetailsCarosuelWidget> {
  late EventDetailsCarosuelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailsCarosuelModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                final imgUrls = widget.parameter4?.imgPaths.toList() ?? [];
                return SizedBox(
                  height: MediaQuery.sizeOf(context).width,
                  child: CarouselSlider.builder(
                    itemCount: imgUrls.length,
                    itemBuilder: (context, imgUrlsIndex, _) {
                      final imgUrlsItem = imgUrls[imgUrlsIndex];
                      return Hero(
                        tag: imgUrlsItem,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            imgUrlsItem,
                            height: MediaQuery.sizeOf(context).width,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                    carouselController: _model.carouselController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: min(1, imgUrls.length - 1),
                      viewportFraction: 0.9,
                      disableCenter: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.05,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(milliseconds: (800 + 4000)),
                      autoPlayCurve: Curves.linear,
                      pauseAutoPlayInFiniteScroll: false,
                      onPageChanged: (index, _) =>
                          _model.carouselCurrentIndex = index,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
