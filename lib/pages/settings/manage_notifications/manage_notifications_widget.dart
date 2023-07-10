import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manage_notifications_model.dart';
export 'manage_notifications_model.dart';

class ManageNotificationsWidget extends StatefulWidget {
  const ManageNotificationsWidget({Key? key}) : super(key: key);

  @override
  _ManageNotificationsWidgetState createState() =>
      _ManageNotificationsWidgetState();
}

class _ManageNotificationsWidgetState extends State<ManageNotificationsWidget> {
  late ManageNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageNotificationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.comNotifs =
            valueOrDefault<bool>(currentUserDocument?.comNotifs, false);
        _model.likesNotifs =
            valueOrDefault<bool>(currentUserDocument?.likesNotifs, false);
        _model.reqNotifs =
            valueOrDefault<bool>(currentUserDocument?.reqNotifs, false);
        _model.devNotifs =
            valueOrDefault<bool>(currentUserDocument?.devNotifs, false);
      });
    });
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Text(
            'Manage Notifications',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Outfit',
                  fontSize: 24.0,
                ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: 796.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).frenchViolet
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        color: FlutterFlowTheme.of(context).noColor,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).noColor,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Comments',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).frenchViolet,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: FlutterFlowTheme.of(context).amethyst,
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.61, -0.19),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 2.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.notifications_active,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              if (!valueOrDefault<bool>(
                                  currentUserDocument?.comNotifs, false))
                                Align(
                                  alignment: AlignmentDirectional(0.9, 0.41),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          comNotifs: true,
                                        ));
                                        setState(() {
                                          _model.comNotifs = true;
                                        });
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.comNotifs, false))
                                Align(
                                  alignment: AlignmentDirectional(-0.96, 0.56),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          comNotifs: false,
                                        ));
                                        setState(() {
                                          _model.comNotifs = false;
                                        });
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          shape: BoxShape.rectangle,
                                        ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        color: FlutterFlowTheme.of(context).noColor,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).noColor,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Likes',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).frenchViolet,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: FlutterFlowTheme.of(context).amethyst,
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.61, -0.09),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 2.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.notifications_active,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              if (!valueOrDefault<bool>(
                                  currentUserDocument?.likesNotifs, false))
                                Align(
                                  alignment: AlignmentDirectional(0.95, 0.19),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          likesNotifs: true,
                                        ));
                                        setState(() {
                                          _model.likesNotifs = true;
                                        });
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.likesNotifs, false))
                                Align(
                                  alignment: AlignmentDirectional(-0.96, 0.56),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          likesNotifs: false,
                                        ));
                                        setState(() {
                                          _model.likesNotifs = false;
                                        });
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          shape: BoxShape.rectangle,
                                        ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        color: FlutterFlowTheme.of(context).noColor,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).noColor,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Friend Requests',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).frenchViolet,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: FlutterFlowTheme.of(context).amethyst,
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.61, -0.47),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 2.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.notifications_active,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              if (!valueOrDefault<bool>(
                                  currentUserDocument?.reqNotifs, false))
                                Align(
                                  alignment: AlignmentDirectional(0.95, -0.03),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          reqNotifs: true,
                                        ));
                                        setState(() {
                                          _model.reqNotifs = true;
                                        });
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.reqNotifs, false))
                                Align(
                                  alignment: AlignmentDirectional(-0.96, 0.56),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          reqNotifs: false,
                                        ));
                                        setState(() {
                                          _model.reqNotifs = false;
                                        });
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          shape: BoxShape.rectangle,
                                        ),
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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 650.0, 0.0, 50.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await launchURL('https://flicks.social/#privacypolicy');
                  },
                  child: Text(
                    'Privacy Policy',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
