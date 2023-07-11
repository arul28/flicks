import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_tour_model.dart';
export 'camera_tour_model.dart';

class CameraTourWidget extends StatefulWidget {
  const CameraTourWidget({Key? key}) : super(key: key);

  @override
  _CameraTourWidgetState createState() => _CameraTourWidgetState();
}

class _CameraTourWidgetState extends State<CameraTourWidget> {
  late CameraTourModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraTourModel());
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
        width: 500.0,
        height: 420.0,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Capture flicks!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Here you can capture flicks! The max number of flicks you can take in the current session are listed in the top left. This is a random amount, and it chnages every time new flicks develop randomly. You can view the flicks you have taken from the top left camera roll icon.\n\n\nRemember, flicks randomly develop and you wont be able to view your current flicks until they have developed.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Close',
                      options: FFButtonOptions(
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
