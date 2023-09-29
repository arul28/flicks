import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/contact_form/contact_form_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'support_form_widget.dart' show SupportFormWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupportFormModel extends FlutterFlowModel<SupportFormWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    subjectFieldControllerValidator = _subjectFieldControllerValidator;
    decriptionFieldControllerValidator = _decriptionFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    subjectFieldController?.dispose();
    decriptionFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
