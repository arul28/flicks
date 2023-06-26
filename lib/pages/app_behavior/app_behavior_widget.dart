import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_behavior_model.dart';
export 'app_behavior_model.dart';

class AppBehaviorWidget extends StatefulWidget {
  const AppBehaviorWidget({Key? key}) : super(key: key);

  @override
  _AppBehaviorWidgetState createState() => _AppBehaviorWidgetState();
}

class _AppBehaviorWidgetState extends State<AppBehaviorWidget>
    with TickerProviderStateMixin {
  late AppBehaviorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(40.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(40.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBehaviorModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
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
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Text(
            'App Behavior',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).frenchViolet,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Push Notifications',
                    style: FlutterFlowTheme.of(context).titleLarge,
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
                          alignment: AlignmentDirectional(-0.9, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 2.0, 0.0, 0.0),
                            child: Icon(
                              Icons.notifications_active,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.96, 0.56),
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
                              borderRadius: BorderRadius.circular(30.0),
                              shape: BoxShape.rectangle,
                            ),
                          ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation1']!,
                              hasBeenTriggered: hasContainerTriggered1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: FlutterFlowTheme.of(context).titleLarge,
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
                          alignment: AlignmentDirectional(-0.9, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 2.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.solidMoon,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.96, 0.56),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (Theme.of(context).brightness ==
                                  Brightness.dark) {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation2'] !=
                                    null) {
                                  await animationsMap[
                                          'containerOnActionTriggerAnimation2']!
                                      .controller
                                      .reverse();
                                }
                                setDarkModeSetting(context, ThemeMode.light);
                                FFAppState().update(() {
                                  FFAppState().isDark = false;
                                });
                              } else {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation2'] !=
                                    null) {
                                  setState(() => hasContainerTriggered2 = true);
                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0));
                                }
                                setDarkModeSetting(context, ThemeMode.dark);
                                setState(() {
                                  FFAppState().isDark = true;
                                });
                              }
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
                                borderRadius: BorderRadius.circular(30.0),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation2']!,
                              hasBeenTriggered: hasContainerTriggered2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
            child: Text(
              'Licensed by BTA food and entertainment ',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Color(0xFF3B454D),
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
