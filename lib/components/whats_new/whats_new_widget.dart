import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'whats_new_model.dart';
export 'whats_new_model.dart';

class WhatsNewWidget extends StatefulWidget {
  const WhatsNewWidget({Key? key}) : super(key: key);

  @override
  _WhatsNewWidgetState createState() => _WhatsNewWidgetState();
}

class _WhatsNewWidgetState extends State<WhatsNewWidget> {
  late WhatsNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WhatsNewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 411.0,
      height: 615.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).frenchViolet,
            FlutterFlowTheme.of(context).heliotrope
          ],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              'WHATS NEW?',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).displayMedium,
            ),
          ),
          Text(
            '\n- NEW FRIEND ACTVITY PAGE!\n\n- NEW FRIEND SUGGESTIONS!\n\n- STREAKS! YOUR PHOTO BORDER CHANGES BETWEEN  BRONZE, SILVER, AND GOLD BASED ON HOW ACTIVE YOU ARE\n\n- NEW DISPLAY ONCE YOU HAVE CAPTURED A FLICK\n\n- BUG FIXES',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.2,
                ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'WE NEED YOUR HELP!!!',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).black600,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  'If you enjoy flicks please take a moment to follow us on IG',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await launchURL('https://www.instagram.com/flicksapp_/');
                  },
                  child: Text(
                    'FLICKS INSTAGRAM',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).persianIndigo,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 10.0),
                child: Text(
                  '(also follow @arul.beats, sanjitvv and trey_dixit)',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Text(
                'TELL YOUR FRIENDS ABOUT FLICKS!!!',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/[removal.ai]_tmp-649156ac0c6fa_JTTV80.png',
                width: 150.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'CONTINUE',
              options: FFButtonOptions(
                width: 217.0,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).frenchViolet,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 10.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
