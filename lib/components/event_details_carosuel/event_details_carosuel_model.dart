import '/flutter_flow/flutter_flow_util.dart';
import 'event_details_carosuel_widget.dart' show EventDetailsCarosuelWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EventDetailsCarosuelModel
    extends FlutterFlowModel<EventDetailsCarosuelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
