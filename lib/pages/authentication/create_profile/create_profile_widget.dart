import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_profile_model.dart';
export 'create_profile_model.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({Key? key}) : super(key: key);

  @override
  _CreateProfileWidgetState createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  late CreateProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfileModel());

    _model.yourNameController ??= TextEditingController();
    _model.usernameCreateController ??= TextEditingController();
    _model.bioCreateController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'flicks',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 243.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).noColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                        child: Text(
                                          'Create your Profile',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 22.0,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 16.0, 0.0),
                                              child: Text(
                                                'Add Profile Image',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFDBE2E7),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/addImage@2x.png',
                                                  ).image,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 4.0,
                                                                4.0, 4.0),
                                                    child: Container(
                                                      width: 120.0,
                                                      height: 120.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .uploadedFileUrl,
                                                          'data:image/jpeg;base64,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',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() =>
                                                        _model.isDataUploading =
                                                            true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];
                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    photoUrl:
                                                        _model.uploadedFileUrl,
                                                  ));
                                                },
                                                text: 'Add Image',
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .amethyst,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_add,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 18.0),
                  child: TextFormField(
                    controller: _model.yourNameController,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.yourNameControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 18.0),
                  child: TextFormField(
                    controller: _model.usernameCreateController,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your Username',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: _model.usernameCreateControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 18.0),
                  child: TextFormField(
                    controller: _model.bioCreateController,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: 'Your bio',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    validator: _model.bioCreateControllerValidator
                        .asValidator(context),
                  ),
                ),
                if (_model.usernameExists == true)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username taken, please try another one',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).error,
                            ),
                      ),
                    ],
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.05),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        _model.usernameCount = await queryUsersRecordCount(
                          queryBuilder: (usersRecord) => usersRecord.where(
                              'display_name',
                              isEqualTo: _model.usernameCreateController.text),
                        );
                        if (_model.usernameCount == 0) {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            displayName: _model.usernameCreateController.text,
                            bio: _model.bioCreateController.text,
                            fullName: _model.yourNameController.text,
                          ));

                          context.pushNamed('Profile');
                        } else {
                          setState(() {
                            _model.usernameExists = true;
                          });
                        }

                        setState(() {});
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).frenchViolet,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
