import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'signup_phone_widget.dart' show SignupPhoneWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupPhoneModel extends FlutterFlowModel<SignupPhoneWidget> {
  ///  Local state fields for this page.

  bool isPr = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Inserire Nome e Cognome';
    }

    if (!RegExp('^[A-Za-z\'’\\-]+(?:\\s[A-Za-z\'’\\-]+)+\$').hasMatch(val)) {
      return 'Inserire Nome e Cognome';
    }
    return null;
  }

  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '+## ### #### ###');
  String? Function(BuildContext, String?)? phoneControllerValidator;
  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Inserire numero di telefono';
    }

    if (val.length < 16) {
      return 'Inserire 12 numeri (2 del prefisso+ 10 del numero)';
    }
    if (val.length > 16) {
      return 'Inserire 12 numeri (2 del prefisso+ 10 del numero)';
    }

    return null;
  }

  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
