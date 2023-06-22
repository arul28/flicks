import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setting_page_model.dart';
export 'setting_page_model.dart';

class SettingPageWidget extends StatefulWidget {
  const SettingPageWidget({Key? key}) : super(key: key);

  @override
  _SettingPageWidgetState createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
  late SettingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingPageModel());
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
            context.safePop();
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Text(
            'Settings ',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 25.0),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.25,
                children: [
                  SlidableAction(
                    label: 'Share',
                    backgroundColor: FlutterFlowTheme.of(context).info,
                    icon: Icons.share,
                    onPressed: (_) {
                      print('SlidableActionWidget pressed ...');
                    },
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'Push Notifications ',
                  style: FlutterFlowTheme.of(context).titleLarge,
                ),
                subtitle: Text(
                  'Flicks allows you full control of your notifications ',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
                trailing: Icon(
                  Icons.arrow_right_outlined,
                ),
                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.25,
                children: [
                  SlidableAction(
                    label: 'Share',
                    backgroundColor: FlutterFlowTheme.of(context).info,
                    icon: Icons.share,
                    onPressed: (_) {
                      print('SlidableActionWidget pressed ...');
                    },
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  'Edit Profile',
                  style: FlutterFlowTheme.of(context).titleLarge,
                ),
                subtitle: Text(
                  'Edit Username, Password or Photo',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                ),
                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                dense: false,
              ),
            ),
          ),
          Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  label: 'Share',
                  backgroundColor: FlutterFlowTheme.of(context).info,
                  icon: Icons.share,
                  onPressed: (_) {
                    print('SlidableActionWidget pressed ...');
                  },
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                'Contact Us',
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              trailing: Icon(
                Icons.arrow_right,
              ),
              tileColor: FlutterFlowTheme.of(context).secondaryBackground,
              dense: false,
            ),
          ),
          Container(
            width: double.infinity,
            height: 400.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(70.0, 0.0, 70.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('LandingPage');
                  },
                  text: 'Log Out\n',
                  options: FFButtonOptions(
                    width: 253.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).frenchViolet,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
