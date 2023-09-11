import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool usernameExists = false;

  bool? imageAdded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  TextEditingController? yourNameController1;
  String? Function(BuildContext, String?)? yourNameController1Validator;
  String? _yourNameController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for yourName widget.
  TextEditingController? yourNameController2;
  String? Function(BuildContext, String?)? yourNameController2Validator;
  String? _yourNameController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'please enter valid phone number';
    }
    if (val.length > 10) {
      return 'please enter valid phone number';
    }

    return null;
  }

  // State field(s) for usernameCreate widget.
  TextEditingController? usernameCreateController;
  String? Function(BuildContext, String?)? usernameCreateControllerValidator;
  String? _usernameCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Username must be between 4 and 20 characters';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for bioCreate widget.
  TextEditingController? bioCreateController;
  String? Function(BuildContext, String?)? bioCreateControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? usernameCount;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    yourNameController1Validator = _yourNameController1Validator;
    yourNameController2Validator = _yourNameController2Validator;
    usernameCreateControllerValidator = _usernameCreateControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    yourNameController1?.dispose();
    yourNameController2?.dispose();
    usernameCreateController?.dispose();
    bioCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
