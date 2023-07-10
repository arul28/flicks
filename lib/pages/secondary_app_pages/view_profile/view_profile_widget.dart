import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/user_actions/user_actions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_profile_model.dart';
export 'view_profile_model.dart';

class ViewProfileWidget extends StatefulWidget {
  const ViewProfileWidget({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  final UsersRecord? userInfo;

  @override
  _ViewProfileWidgetState createState() => _ViewProfileWidgetState();
}

class _ViewProfileWidgetState extends State<ViewProfileWidget> {
  late ViewProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.friendsList?.toList() ?? [])
          .contains(widget.userInfo!.reference)) {
        setState(() {
          _model.isFriend = true;
        });
      } else if ((currentUserDocument?.sentPendingRequests?.toList() ?? [])
          .contains(widget.userInfo!.reference)) {
        setState(() {
          _model.sentWaiting = true;
        });
      } else if ((currentUserDocument?.incomingPendingRequests?.toList() ?? [])
          .contains(widget.userInfo!.reference)) {
        setState(() {
          _model.recievedWaiting = true;
        });
      } else {
        setState(() {
          _model.noConnection = true;
        });
      }
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).lineColor,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Icon(
                Icons.chevron_left,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 35.0, 0.0),
              child: SelectionArea(
                  child: Text(
                widget.userInfo!.displayName,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).frenchViolet,
                      fontSize: 24.0,
                    ),
              )),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showAlignedDialog(
                      context: context,
                      isGlobal: true,
                      avoidOverflow: false,
                      targetAnchor: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      followerAnchor: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      builder: (dialogContext) {
                        return Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_model.unfocusNode),
                            child: Container(
                              height: 200.0,
                              width: 300.0,
                              child: UserActionsWidget(
                                userRef: widget.userInfo!.reference,
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Icon(
                    Icons.keyboard_control,
                    color: FlutterFlowTheme.of(context).frenchViolet,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).lineColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  'usersFriends',
                                  queryParameters: {
                                    'userRef': serializeParam(
                                      widget.userInfo!.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  },
                                );
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  widget.userInfo!.friendsNum.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 40.0,
                                    ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'usersFriends',
                                  queryParameters: {
                                    'userRef': serializeParam(
                                      widget.userInfo!.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  },
                                );
                              },
                              child: Text(
                                'Friends',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).amethyst,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            widget.userInfo!.photoUrl,
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.userInfo!.pinnedNum.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 40.0,
                                  ),
                            ),
                            Text(
                              'Pinned',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color:
                                        FlutterFlowTheme.of(context).amethyst,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).noColor,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      widget.userInfo!.bio.maybeHandleOverflow(
                                        maxChars: 40,
                                        replacement: '…',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if (_model.noConnection == true)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await currentUserReference!.update({
                                      'sentPendingRequests':
                                          FieldValue.arrayUnion(
                                              [widget.userInfo!.reference]),
                                      'sentPendingRequestsNum':
                                          FieldValue.increment(1),
                                    });

                                    await widget.userInfo!.reference.update({
                                      'incomingPendingRequests':
                                          FieldValue.arrayUnion(
                                              [currentUserReference]),
                                      'incomingPendingRequestsNum':
                                          FieldValue.increment(1),
                                    });
                                    if (widget.userInfo!.reqNotifs) {
                                      triggerPushNotification(
                                        notificationTitle: 'New Friend Request',
                                        notificationText:
                                            'Someone has added you as a friend!',
                                        notificationSound: 'default',
                                        userRefs: [widget.userInfo!.reference],
                                        initialPageName: 'Profile',
                                        parameterData: {},
                                      );
                                    }
                                    setState(() {
                                      _model.sentWaiting = true;
                                      _model.noConnection = false;
                                      _model.isFriend = false;
                                      _model.recievedWaiting = false;
                                    });
                                  },
                                  child: Container(
                                    width: 200.0,
                                    height: 60.0,
                                    constraints: BoxConstraints(
                                      maxHeight: 32.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .heliotrope,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x32171717),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(70.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.person_add,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Add Friend',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.isFriend == true)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Remove Friend?'),
                                                  content: Text(
                                                      'Are you sure you want to remove this friend?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await currentUserReference!.update({
                                        'friendsList': FieldValue.arrayRemove(
                                            [widget.userInfo!.reference]),
                                        'friendsNum':
                                            FieldValue.increment(-(1)),
                                      });

                                      await widget.userInfo!.reference.update({
                                        'friendsList': FieldValue.arrayRemove(
                                            [currentUserReference]),
                                        'friendsNum':
                                            FieldValue.increment(-(1)),
                                      });
                                      setState(() {
                                        _model.isFriend = false;
                                        _model.noConnection = true;
                                        _model.sentWaiting = false;
                                        _model.recievedWaiting = false;
                                      });
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 200.0,
                                    height: 60.0,
                                    constraints: BoxConstraints(
                                      maxHeight: 32.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .frenchViolet,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x32171717),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(70.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.group_remove,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Remove Friend',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.sentWaiting)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 200.0,
                                  height: 60.0,
                                  constraints: BoxConstraints(
                                    maxHeight: 32.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).amethyst,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x32171717),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(70.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Friend Request Sent',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.recievedWaiting)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await currentUserReference!.update({
                                      'friendsList': FieldValue.arrayUnion(
                                          [widget.userInfo!.reference]),
                                      'friendsNum': FieldValue.increment(1),
                                      'incomingPendingRequests':
                                          FieldValue.arrayRemove(
                                              [widget.userInfo!.reference]),
                                      'incomingPendingRequestsNum':
                                          FieldValue.increment(-(1)),
                                    });

                                    await widget.userInfo!.reference.update({
                                      'friendsList': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                      'friendsNum': FieldValue.increment(1),
                                      'sentPendingRequests':
                                          FieldValue.arrayRemove(
                                              [currentUserReference]),
                                      'sentPendingRequestsNum':
                                          FieldValue.increment(-(1)),
                                    });
                                    if (widget.userInfo!.reqNotifs) {
                                      triggerPushNotification(
                                        notificationTitle: 'New friend added',
                                        notificationText:
                                            'Someone accepted your friend request!',
                                        notificationSound: 'default',
                                        userRefs: [widget.userInfo!.reference],
                                        initialPageName: 'Feed',
                                        parameterData: {},
                                      );
                                    }
                                    setState(() {
                                      _model.isFriend = true;
                                      _model.recievedWaiting = false;
                                      _model.noConnection = false;
                                      _model.sentWaiting = false;
                                    });
                                  },
                                  child: Container(
                                    width: 200.0,
                                    height: 60.0,
                                    constraints: BoxConstraints(
                                      maxHeight: 32.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3124A1),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x32171717),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(70.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Accept Friend Request',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 543.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 10.0, 4.0, 0.0),
                                child: StreamBuilder<List<PinnedRecord>>(
                                  stream: queryPinnedRecord(
                                    parent: widget.userInfo!.reference,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PinnedRecord>
                                        staggeredViewPinnedRecordList =
                                        snapshot.data!;
                                    return MasonryGridView.count(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount:
                                          staggeredViewPinnedRecordList.length,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewPinnedRecord =
                                            staggeredViewPinnedRecordList[
                                                staggeredViewIndex];
                                        return FlipCard(
                                          fill: Fill.fillBack,
                                          direction: FlipDirection.HORIZONTAL,
                                          speed: 400,
                                          front: Container(
                                            width: 100.0,
                                            height: 168.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                staggeredViewPinnedRecord
                                                    .imagePath,
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          back: Container(
                                            width: 100.0,
                                            height: 168.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  dateTimeFormat(
                                                      'yMMMd',
                                                      staggeredViewPinnedRecord
                                                          .timeTaken!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 6.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/[removal.ai]_tmp-649156ac0c6fa_JTTV80.png',
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
