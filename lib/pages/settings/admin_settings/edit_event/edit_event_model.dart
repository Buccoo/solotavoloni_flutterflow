import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_event_widget.dart' show EditEventWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditEventModel extends FlutterFlowModel<EditEventWidget> {
  ///  Local state fields for this page.

  List<String> inputGuests = [];
  void addToInputGuests(String item) => inputGuests.add(item);
  void removeFromInputGuests(String item) => inputGuests.remove(item);
  void removeAtIndexFromInputGuests(int index) => inputGuests.removeAt(index);
  void insertAtIndexInInputGuests(int index, String item) =>
      inputGuests.insert(index, item);
  void updateInputGuestsAtIndex(int index, Function(String) updateFn) =>
      inputGuests[index] = updateFn(inputGuests[index]);

  List<AreasRecord> areasState = [];
  void addToAreasState(AreasRecord item) => areasState.add(item);
  void removeFromAreasState(AreasRecord item) => areasState.remove(item);
  void removeAtIndexFromAreasState(int index) => areasState.removeAt(index);
  void insertAtIndexInAreasState(int index, AreasRecord item) =>
      areasState.insert(index, item);
  void updateAreasStateAtIndex(int index, Function(AreasRecord) updateFn) =>
      areasState[index] = updateFn(areasState[index]);

  List<String> imgsPath = [];
  void addToImgsPath(String item) => imgsPath.add(item);
  void removeFromImgsPath(String item) => imgsPath.remove(item);
  void removeAtIndexFromImgsPath(int index) => imgsPath.removeAt(index);
  void insertAtIndexInImgsPath(int index, String item) =>
      imgsPath.insert(index, item);
  void updateImgsPathAtIndex(int index, Function(String) updateFn) =>
      imgsPath[index] = updateFn(imgsPath[index]);

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
