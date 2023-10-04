import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_to_flicks_model.dart';
export 'welcome_to_flicks_model.dart';

class WelcomeToFlicksWidget extends StatefulWidget {
  const WelcomeToFlicksWidget({Key? key}) : super(key: key);

  @override
  _WelcomeToFlicksWidgetState createState() => _WelcomeToFlicksWidgetState();
}

class _WelcomeToFlicksWidgetState extends State<WelcomeToFlicksWidget> {
  late WelcomeToFlicksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeToFlicksModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'WELCOME TO FLICKS!',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).heliotrope,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).textColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 500.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              onPageChanged: (_) => setState(() {}),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, -1.00),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/flicks-da809.appspot.com/o/introPics%2FIMG_7957.PNG?alt=media&token=abf49633-70ef-4134-b711-187297a56f5a&_gl=1*15xmiob*_ga*MjEzNzc1NjI0OC4xNjg3MzAwMzY3*_ga_CW55HF8NVT*MTY5NjQwOTE3Ni44MS4xLjE2OTY0MDk0ODYuNjAuMC4w',
                                          width: 300.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                        child: Text(
                                          'This is your profile!\nHere you can view your flicks that you have pinned.\nYou can also view your friends and edit your profile.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                lineHeight: 1.7,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, -1.00),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/flicks-da809.appspot.com/o/introPics%2FIMG_7958.PNG?alt=media&token=61758123-7819-47a2-afd7-6f7024fe8124&_gl=1*4zzjb2*_ga*MjEzNzc1NjI0OC4xNjg3MzAwMzY3*_ga_CW55HF8NVT*MTY5NjQwOTE3Ni44MS4xLjE2OTY0MTAzMTkuNjAuMC4w',
                                          width: 300.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: Text(
                                        'The numbers in the top left show how many flicks you can take until the current roll all develop\nClick the camera roll in the top left to view captured flicks',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 14.0,
                                              lineHeight: 1.7,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, -1.00),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/flicks-da809.appspot.com/o/introPics%2FIMG_7962.PNG?alt=media&token=9bb0df80-038f-4f04-931e-88fca3cf4f88&_gl=1*1m6s2sj*_ga*MjEzNzc1NjI0OC4xNjg3MzAwMzY3*_ga_CW55HF8NVT*MTY5NjQwOTE3Ni44MS4xLjE2OTY0MTA0NTkuNTQuMC4w',
                                          width: 300.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          'When you click the camera roll you can see your flick\nEvery 1-3 days, everyones flicks randomly develop at the same time, and you will be able to take more flicks again!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                lineHeight: 1.7,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, -1.00),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/flicks-da809.appspot.com/o/introPics%2FIMG_7963.PNG?alt=media&token=a6df2165-de86-4d96-8db2-5007422bf1ca&_gl=1*1x0dp76*_ga*MjEzNzc1NjI0OC4xNjg3MzAwMzY3*_ga_CW55HF8NVT*MTY5NjQwOTE3Ni44MS4xLjE2OTY0MTA4NzguMjUuMC4w',
                                          width: 300.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          'Here you can see everyones flicks once they develop!\nClick on the pin near your flicks to pin to your profile!\nComment and like your friends flicks!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                lineHeight: 1.9,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, -1.00),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/flicks-da809.appspot.com/o/introPics%2FIMG_7960.PNG?alt=media&token=6a380bcd-73a1-4fa2-9190-d70a593c5861&_gl=1*1rpk0h9*_ga*MjEzNzc1NjI0OC4xNjg3MzAwMzY3*_ga_CW55HF8NVT*MTY5NjQwOTE3Ni44MS4xLjE2OTY0MTExMzEuNDcuMC4w',
                                          width: 300.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 60.0),
                                        child: Text(
                                          'Search for your friends to get started with flicks!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                lineHeight: 1.9,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().profileTour = true;

                                          context.goNamed(
                                            'Profile',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Continue to flicks!',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                count: 5,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 3.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 8.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Swipe to learn how to use flicks!',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).frenchViolet,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
