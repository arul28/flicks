import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

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

    return Scaffold(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Edit your Profile',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                              ),
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      if (_model.usernameExists == false)
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 120.0,
                            height: 120.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              currentUserPhoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if (_model.picChanged == true)
                        Container(
                          width: 120.0,
                          height: 120.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            _model.uploadedFileUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];
                          var downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl = downloadUrls.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        setState(() {
                          _model.picChanged = true;
                        });
                      },
                      text: 'Change Photo',
                      options: FFButtonOptions(
                        height: 29.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 13.0,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          photoUrl: _model.uploadedFileUrl,
                        ));

                        context.pushNamed(
                          'Profile',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      },
                      text: 'Save Photo',
                      options: FFButtonOptions(
                        height: 29.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).amethyst,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 13.0,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 13.0,
                                  ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          tabs: [
                            Tab(
                              text: 'Name',
                            ),
                            Tab(
                              text: 'Username',
                            ),
                            Tab(
                              text: 'Bio',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 32.0, 20.0, 16.0),
                                  child: TextFormField(
                                    controller: _model.yourNameController,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Your Name',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model
                                        .yourNameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.05),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          fullName:
                                              _model.yourNameController.text,
                                        ));

                                        context.pushNamed(
                                          'Profile',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Update Name',
                                      options: FFButtonOptions(
                                        width: 180.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .frenchViolet,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 32.0, 20.0, 16.0),
                                    child: TextFormField(
                                      controller:
                                          _model.usernameCreateController,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Your Username',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .usernameCreateControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                if (_model.usernameExists == true)
                                  Text(
                                    'Username taken, please try another one',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.05),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        _model.numOfUsername =
                                            await queryUsersRecordCount(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where('display_name',
                                                  isEqualTo: _model
                                                      .usernameCreateController
                                                      .text),
                                        );
                                        if (_model.numOfUsername == 0) {
                                          HapticFeedback.lightImpact();

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            displayName: _model
                                                .usernameCreateController.text,
                                          ));

                                          context.pushNamed(
                                            'Profile',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        } else {
                                          setState(() {
                                            _model.usernameExists = true;
                                          });
                                        }

                                        setState(() {});
                                      },
                                      text: 'Update Username',
                                      options: FFButtonOptions(
                                        width: 180.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .frenchViolet,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 32.0, 20.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.bioCreateController,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintText: 'Your bio',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    validator: _model
                                        .bioCreateControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.05),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          bio: _model.bioCreateController.text,
                                        ));

                                        context.pushNamed(
                                          'Profile',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Update Bio',
                                      options: FFButtonOptions(
                                        width: 180.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .frenchViolet,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
    );
  }
}
