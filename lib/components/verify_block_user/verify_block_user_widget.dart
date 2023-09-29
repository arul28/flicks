import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_block_user_model.dart';
export 'verify_block_user_model.dart';

class VerifyBlockUserWidget extends StatefulWidget {
  const VerifyBlockUserWidget({
    Key? key,
    required this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _VerifyBlockUserWidgetState createState() => _VerifyBlockUserWidgetState();
}

class _VerifyBlockUserWidgetState extends State<VerifyBlockUserWidget> {
  late VerifyBlockUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyBlockUserModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        width: 317.0,
        height: 162.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Are you sure you want to block this user, you will not be able to view their profile or posts, and they won\'t be able to see yours, you can unblock a user in settings',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF57636C),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 25.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 108.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).frenchViolet,
                        textStyle: FlutterFlowTheme.of(context).titleSmall,
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 25.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if ((currentUserDocument?.friendsList?.toList() ?? [])
                            .contains(widget.userRef)) {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'friendsList':
                                    FieldValue.arrayRemove([widget.userRef]),
                                'friendsNum': FieldValue.increment(-(1)),
                              },
                            ),
                          });

                          await widget.userRef!.update({
                            ...mapToFirestore(
                              {
                                'friendsList': FieldValue.arrayRemove(
                                    [currentUserReference]),
                                'friendsNum': FieldValue.increment(-(1)),
                              },
                            ),
                          });
                        } else if ((currentUserDocument?.sentPendingRequests
                                    ?.toList() ??
                                [])
                            .contains(widget.userRef)) {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'sentPendingRequests':
                                    FieldValue.arrayRemove([widget.userRef]),
                                'sentPendingRequestsNum':
                                    FieldValue.increment(-(1)),
                              },
                            ),
                          });

                          await widget.userRef!.update({
                            ...mapToFirestore(
                              {
                                'incomingPendingRequests':
                                    FieldValue.arrayRemove(
                                        [currentUserReference]),
                                'incomingPendingRequestsNum':
                                    FieldValue.increment(-(1)),
                              },
                            ),
                          });
                        } else if ((currentUserDocument?.incomingPendingRequests
                                    ?.toList() ??
                                [])
                            .contains(widget.userRef)) {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'incomingPendingRequests':
                                    FieldValue.arrayRemove([widget.userRef]),
                                'incomingPendingRequestsNum':
                                    FieldValue.increment(-(1)),
                              },
                            ),
                          });

                          await widget.userRef!.update({
                            ...mapToFirestore(
                              {
                                'sentPendingRequests': FieldValue.arrayRemove(
                                    [currentUserReference]),
                                'sentPendingRequestsNum':
                                    FieldValue.increment(-(1)),
                              },
                            ),
                          });
                        }

                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'blockedUsers':
                                  FieldValue.arrayUnion([widget.userRef]),
                              'iBlocked':
                                  FieldValue.arrayUnion([widget.userRef]),
                            },
                          ),
                        });

                        await widget.userRef!.update({
                          ...mapToFirestore(
                            {
                              'blockedUsers':
                                  FieldValue.arrayUnion([currentUserReference]),
                              'blockedBy':
                                  FieldValue.arrayUnion([currentUserReference]),
                            },
                          ),
                        });

                        context.pushNamed(
                          'Profile',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: 108.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).frenchViolet,
                        textStyle: FlutterFlowTheme.of(context).titleSmall,
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
