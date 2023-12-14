import '/components/event_details_carosuel/event_details_carosuel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_details_widget.dart' show EventDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EventDetailsModel extends FlutterFlowModel<EventDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EventDetailsCarosuel component.
  late EventDetailsCarosuelModel eventDetailsCarosuelModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    eventDetailsCarosuelModel =
        createModel(context, () => EventDetailsCarosuelModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    eventDetailsCarosuelModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
