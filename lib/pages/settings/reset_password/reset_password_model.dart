import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/email_reset_fail/email_reset_fail_widget.dart';
import '/components/email_reset_success/email_reset_success_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for currentPass widget.
  TextEditingController? currentPassController;
  late bool currentPassVisibility;
  String? Function(BuildContext, String?)? currentPassControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currentPassVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailController?.dispose();
    currentPassController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
