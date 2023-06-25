import '/components/contact_form/contact_form_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportFormModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for username_field widget.
  TextEditingController? usernameFieldController;
  String? Function(BuildContext, String?)? usernameFieldControllerValidator;
  String? _usernameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for subject_field widget.
  TextEditingController? subjectFieldController;
  String? Function(BuildContext, String?)? subjectFieldControllerValidator;
  String? _subjectFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for decription_field widget.
  TextEditingController? decriptionFieldController;
  String? Function(BuildContext, String?)? decriptionFieldControllerValidator;
  String? _decriptionFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 400) {
      return 'Error, description must be under400 characters';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    usernameFieldControllerValidator = _usernameFieldControllerValidator;
    subjectFieldControllerValidator = _subjectFieldControllerValidator;
    decriptionFieldControllerValidator = _decriptionFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    usernameFieldController?.dispose();
    subjectFieldController?.dispose();
    decriptionFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
