import '/backend/backend.dart';
import '/components/comments/comments_widget.dart';
import '/components/social_options/social_options_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImageViewerModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for socialOptions component.
  late SocialOptionsModel socialOptionsModel;
  // Model for comments component.
  late CommentsModel commentsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    socialOptionsModel = createModel(context, () => SocialOptionsModel());
    commentsModel = createModel(context, () => CommentsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    socialOptionsModel.dispose();
    commentsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
