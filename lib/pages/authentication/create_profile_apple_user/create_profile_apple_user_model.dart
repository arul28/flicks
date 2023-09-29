import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_profile_apple_user_widget.dart'
    show CreateProfileAppleUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileAppleUserModel
    extends FlutterFlowModel<CreateProfileAppleUserWidget> {
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
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for usernameCreate widget.
  TextEditingController? usernameCreateController;
  String? Function(BuildContext, String?)? usernameCreateControllerValidator;
  // State field(s) for bioCreate widget.
  TextEditingController? bioCreateController;
  String? Function(BuildContext, String?)? bioCreateControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? usernameCount;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    yourNameController?.dispose();
    usernameCreateController?.dispose();
    bioCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
