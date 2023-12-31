import '/components/poster_carousel/poster_carousel_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_details_widget.dart' show EventDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EventDetailsModel extends FlutterFlowModel<EventDetailsWidget> {
  ///  Local state fields for this page.

  int areaSelected = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PosterCarousel component.
  late PosterCarouselModel posterCarouselModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    posterCarouselModel = createModel(context, () => PosterCarouselModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    posterCarouselModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
