import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for currentPass widget.
  TextEditingController? currentPassController;
  String? Function(BuildContext, String?)? currentPassControllerValidator;
  // State field(s) for newpass widget.
  TextEditingController? newpassController;
  String? Function(BuildContext, String?)? newpassControllerValidator;
  // State field(s) for newpassconfirm widget.
  TextEditingController? newpassconfirmController;
  String? Function(BuildContext, String?)? newpassconfirmControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    currentPassController?.dispose();
    newpassController?.dispose();
    newpassconfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
