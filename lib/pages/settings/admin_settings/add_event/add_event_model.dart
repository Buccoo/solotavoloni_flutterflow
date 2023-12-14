import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_event_widget.dart' show AddEventWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEventModel extends FlutterFlowModel<AddEventWidget> {
  ///  Local state fields for this page.

  List<String> inputGuests = [];
  void addToInputGuests(String item) => inputGuests.add(item);
  void removeFromInputGuests(String item) => inputGuests.remove(item);
  void removeAtIndexFromInputGuests(int index) => inputGuests.removeAt(index);
  void insertAtIndexInInputGuests(int index, String item) =>
      inputGuests.insert(index, item);
  void updateInputGuestsAtIndex(int index, Function(String) updateFn) =>
      inputGuests[index] = updateFn(inputGuests[index]);

  List<String> imgUrlsState = [];
  void addToImgUrlsState(String item) => imgUrlsState.add(item);
  void removeFromImgUrlsState(String item) => imgUrlsState.remove(item);
  void removeAtIndexFromImgUrlsState(int index) => imgUrlsState.removeAt(index);
  void insertAtIndexInImgUrlsState(int index, String item) =>
      imgUrlsState.insert(index, item);
  void updateImgUrlsStateAtIndex(int index, Function(String) updateFn) =>
      imgUrlsState[index] = updateFn(imgUrlsState[index]);

  List<String> imgPathsState = [];
  void addToImgPathsState(String item) => imgPathsState.add(item);
  void removeFromImgPathsState(String item) => imgPathsState.remove(item);
  void removeAtIndexFromImgPathsState(int index) =>
      imgPathsState.removeAt(index);
  void insertAtIndexInImgPathsState(int index, String item) =>
      imgPathsState.insert(index, item);
  void updateImgPathsStateAtIndex(int index, Function(String) updateFn) =>
      imgPathsState[index] = updateFn(imgPathsState[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  DateTime? datePicked;
  Color? colorPicked;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventsRecord? eventRef;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
