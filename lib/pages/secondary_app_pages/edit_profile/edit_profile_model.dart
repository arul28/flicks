import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool usernameExists = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for usernameCreate widget.
  TextEditingController? usernameCreateController;
  String? Function(BuildContext, String?)? usernameCreateControllerValidator;
  // State field(s) for bioCreate widget.
  TextEditingController? bioCreateController;
  String? Function(BuildContext, String?)? bioCreateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yourNameController?.dispose();
    usernameCreateController?.dispose();
    bioCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
