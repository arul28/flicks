import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pics_limit_hit/pics_limit_hit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_model.dart';
export 'camera_model.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget>
    with TickerProviderStateMixin {
  late CameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 880.ms,
          begin: 0.0,
          end: 2.0,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1380.ms,
          hz: 4,
          offset: Offset(3.0, 3.0),
          rotation: 0.087,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().makePhoto = false;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryCurrentSessionPicsRecordCount(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        int cameraCount = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(42.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Text(
                              'flicks',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .frenchViolet,
                                    fontSize: 40.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (!_model.takingImage!)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.camera_roll,
                            color: FlutterFlowTheme.of(context).frenchViolet,
                            size: 35.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('currentSessionPhotosDetails');
                          },
                        ).animateOnActionTrigger(
                          animationsMap['iconButtonOnActionTriggerAnimation']!,
                        ),
                      ),
                  ],
                ),
                actions: [],
                centerTitle: true,
              ),
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<CurrentSessionDetailsRecord>>(
                stream: queryCurrentSessionDetailsRecord(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    );
                  }
                  List<CurrentSessionDetailsRecord>
                      stackCurrentSessionDetailsRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final stackCurrentSessionDetailsRecord =
                      stackCurrentSessionDetailsRecordList.isNotEmpty
                          ? stackCurrentSessionDetailsRecordList.first
                          : null;
                  return Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.CameraPhoto(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      if (!_model.takingImage!)
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed('currentSessionPhotosDetails');
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        cameraCount.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '/',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        stackCurrentSessionDetailsRecord!
                                            .maxPics
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 10.0,
                                      ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      if (!_model.takingImage!)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (cameraCount >=
                                      stackCurrentSessionDetailsRecord!
                                          .maxPics) {
                                    await showAlignedDialog(
                                      context: context,
                                      isGlobal: true,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode),
                                            child: PicsLimitHitWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  } else {
                                    HapticFeedback.heavyImpact();
                                    setState(() {
                                      FFAppState().makePhoto = true;
                                    });
                                    setState(() {
                                      _model.takingImage = true;
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 2000));

                                    await CurrentSessionPicsRecord.createDoc(
                                            currentUserReference!)
                                        .set({
                                      ...createCurrentSessionPicsRecordData(
                                        imagePath: functions.strToImgPath(
                                            FFAppState().filePath),
                                      ),
                                      'timeTaken': FieldValue.serverTimestamp(),
                                    });
                                    setState(() {
                                      _model.takingImage = false;
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.circle_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).frenchViolet,
                                  size: 80.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_model.takingImage ?? true)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_model.takingImage ?? true)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/[removal.ai]_tmp-649156ac0c6fa_JTTV80.png',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ],
                            ),
                          if (_model.takingImage ?? true)
                            Text(
                              'flick captured!',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                        ],
                      ),
                      if (!_model.takingImage!)
                        Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 20.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().switchCam =
                                      !FFAppState().switchCam ? true : false;
                                });
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              },
                              child: Icon(
                                Icons.flip_camera_android_outlined,
                                color:
                                    FlutterFlowTheme.of(context).frenchViolet,
                                size: 50.0,
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['iconOnActionTriggerAnimation']!,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
