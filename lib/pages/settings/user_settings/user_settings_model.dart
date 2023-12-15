import '/components/switch_light_dark_mode/switch_light_dark_mode_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_settings_widget.dart' show UserSettingsWidget;
import 'package:flutter/material.dart';

class UserSettingsModel extends FlutterFlowModel<UserSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SwitchLightDarkMode component.
  late SwitchLightDarkModeModel switchLightDarkModeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    switchLightDarkModeModel =
        createModel(context, () => SwitchLightDarkModeModel());
  }

  @override
  void dispose() {
    switchLightDarkModeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
