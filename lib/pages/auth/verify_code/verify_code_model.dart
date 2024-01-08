import '/flutter_flow/flutter_flow_util.dart';
import 'verify_code_widget.dart' show VerifyCodeWidget;
import 'package:flutter/material.dart';

class VerifyCodeModel extends FlutterFlowModel<VerifyCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for codiceOTP widget.
  FocusNode? codiceOTPFocusNode;
  TextEditingController? codiceOTPController;
  String? Function(BuildContext, String?)? codiceOTPControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codiceOTPFocusNode?.dispose();
    codiceOTPController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
