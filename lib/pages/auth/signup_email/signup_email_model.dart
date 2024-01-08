import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'signup_email_widget.dart' show SignupEmailWidget;
import 'package:flutter/material.dart';

class SignupEmailModel extends FlutterFlowModel<SignupEmailWidget> {
  ///  Local state fields for this page.

  bool isPr = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NomeField widget.
  FocusNode? nomeFieldFocusNode;
  TextEditingController? nomeFieldController;
  String? Function(BuildContext, String?)? nomeFieldControllerValidator;
  String? _nomeFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Inserire Nome e Cognome';
    }

    if (!RegExp('^[A-Za-z\'’\\-]+(?:\\s[A-Za-z\'’\\-]+)+\$').hasMatch(val)) {
      return 'Inserire Nome e Cognome';
    }
    return null;
  }

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  String? _emailFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Inserire Email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email non corretta.';
    }
    return null;
  }

  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  String? _phoneFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Inserire numero di telefono valido';
    }

    if (val.length < 10) {
      return 'Inserire numero di telefono valido';
    }
    if (val.length > 10) {
      return 'Inserire numero di telefono valido';
    }

    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  String? _passwordFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Inserire password';
    }

    if (val.length < 6) {
      return 'Almeno 6 caratteri';
    }

    return null;
  }

  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nomeFieldControllerValidator = _nomeFieldControllerValidator;
    emailFieldControllerValidator = _emailFieldControllerValidator;
    phoneFieldControllerValidator = _phoneFieldControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldControllerValidator = _passwordFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeFieldFocusNode?.dispose();
    nomeFieldController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
