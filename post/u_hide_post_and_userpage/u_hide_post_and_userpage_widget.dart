import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_group/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'u_hide_post_and_userpage_model.dart';
export 'u_hide_post_and_userpage_model.dart';

class UHidePostAndUserpageWidget extends StatefulWidget {
  const UHidePostAndUserpageWidget({super.key});

  @override
  State<UHidePostAndUserpageWidget> createState() =>
      _UHidePostAndUserpageWidgetState();
}

class _UHidePostAndUserpageWidgetState extends State<UHidePostAndUserpageWidget>
    with TickerProviderStateMixin {
  late UHidePostAndUserpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UHidePostAndUserpageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'uHidePostAndUserpage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('U_HIDE_POST_AND_USERuHidePostAndUserpage');
      logFirebaseEvent('uHidePostAndUserpage_custom_action');
      _model.hidePostCollectionReverse = await actions.reverseAction(
        (currentUserDocument?.hidePostTimeCo.toList() ?? []).toList(),
      );
      logFirebaseEvent('uHidePostAndUserpage_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'hide_post_time_co': getPostWithTimeListFirestoreData(
              _model.hidePostCollectionReverse,
            ),
          },
        ),
      });
      while (_model.tempnumber! <
          (currentUserDocument?.hidePostTimeCo.toList() ?? []).length) {
        logFirebaseEvent('uHidePostAndUserpage_custom_action');
        _model.exist = await actions.ifdofisexistPost(
          (currentUserDocument?.hidePostTimeCo.toList() ??
                  [])[_model.tempnumber!]
              .postCollection!,
        );
        if (_model.exist!) {
          logFirebaseEvent('uHidePostAndUserpage_update_page_state');
          _model.addToDontdeletehide(
              (currentUserDocument?.hidePostTimeCo.toList() ??
                  [])[_model.tempnumber!]);
          setState(() {});
          logFirebaseEvent('uHidePostAndUserpage_update_page_state');
          _model.addToDontdeletehidepost(
              (currentUserDocument?.hidePostTimeCo.toList() ??
                      [])[_model.tempnumber!]
                  .postCollection!);
          setState(() {});
        }
        logFirebaseEvent('uHidePostAndUserpage_update_page_state');
        _model.tempnumber = _model.tempnumber! + 1;
        setState(() {});
      }
      logFirebaseEvent('uHidePostAndUserpage_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'hide_post_time_co': getPostWithTimeListFirestoreData(
              _model.dontdeletehide,
            ),
            'hide_post': _model.dontdeletehidepost,
          },
        ),
      });
      logFirebaseEvent('uHidePostAndUserpage_update_page_state');
      _model.tempnumber = 0;
      setState(() {});
      while (_model.tempnumber! <
          (currentUserDocument?.blockUser.toList() ?? []).length) {
        logFirebaseEvent('uHidePostAndUserpage_custom_action');
        _model.existuser = await actions.ifdofisexistUser(
          (currentUserDocument?.blockUser.toList() ?? [])[_model.tempnumber!],
        );
        if (_model.existuser!) {
          logFirebaseEvent('uHidePostAndUserpage_update_page_state');
          _model.addToDontdeleteuser(
              (currentUserDocument?.blockUser.toList() ??
                  [])[_model.tempnumber!]);
          setState(() {});
        }
        logFirebaseEvent('uHidePostAndUserpage_update_page_state');
        _model.tempnumber = _model.tempnumber! + 1;
        setState(() {});
      }
      logFirebaseEvent('uHidePostAndUserpage_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'block_user': _model.dontdeleteuser,
          },
        ),
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: const Offset(10.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: const Offset(10.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).accent1,
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).accent1,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'U_HIDE_POST_AND_USERarrow_back_rounded_I');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'YuPearl',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        indicatorColor: const Color(0xFF42BAF1),
                        padding: const EdgeInsets.all(4.0),
                        tabs: const [
                          Tab(
                            text: '隱藏的貼文',
                          ),
                          Tab(
                            text: '封鎖的用戶',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final hidePostlist =
                                            (currentUserDocument?.hidePostTimeCo
                                                        .toList() ??
                                                    [])
                                                .toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: hidePostlist.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, hidePostlistIndex) {
                                            final hidePostlistItem =
                                                hidePostlist[hidePostlistIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: StreamBuilder<PostRecord>(
                                                stream: FFAppState()
                                                    .uCollectionPost(
                                                  uniqueQueryKey:
                                                      hidePostlistItem
                                                          .postCollection?.id,
                                                  requestFn: () =>
                                                      PostRecord.getDocument(
                                                          hidePostlistItem
                                                              .postCollection!),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitRipple(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final stackPostRecord =
                                                      snapshot.data!;
                                                  return Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'U_HIDE_POST_AND_USERColumn_467b0vmh_ON_T');
                                                            logFirebaseEvent(
                                                                'Column_update_page_state');
                                                            _model.showSharebottom =
                                                                false;
                                                            setState(() {});
                                                          },
                                                          child:
                                                              SingleChildScrollView(
                                                            primary: false,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0x13727D85),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child: StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        stackPostRecord
                                                                            .postUser!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final rowUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (rowUsersRecord.photoUrl != '') {
                                                                                  return Stack(
                                                                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 42.0,
                                                                                        height: 42.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: const BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          rowUsersRecord.photoUrl,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      if (functions.verifyemail(rowUsersRecord.email) == true)
                                                                                        const Align(
                                                                                          alignment: AlignmentDirectional(1.0, 1.0),
                                                                                          child: Icon(
                                                                                            Icons.check_circle_rounded,
                                                                                            color: Color(0xFF42BAF1),
                                                                                            size: 12.0,
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  );
                                                                                } else {
                                                                                  return Container(
                                                                                    width: 42.0,
                                                                                    height: 42.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.person,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                        if (functions.verifyemail(rowUsersRecord.email) == true)
                                                                                          const Align(
                                                                                            alignment: AlignmentDirectional(1.0, 1.0),
                                                                                            child: Icon(
                                                                                              Icons.check_circle_rounded,
                                                                                              color: Color(0xFF42BAF1),
                                                                                              size: 12.0,
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              height: 53.0,
                                                                              decoration: const BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('U_HIDE_POST_AND_USERuser_name_ON_TAP');
                                                                                                      logFirebaseEvent('user_name_navigate_to');

                                                                                                      context.pushNamed(
                                                                                                        'link_userprofile',
                                                                                                        queryParameters: {
                                                                                                          'profileUserRef': serializeParam(
                                                                                                            rowUsersRecord.reference,
                                                                                                            ParamType.DocumentReference,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    child: Text(
                                                                                                      rowUsersRecord.displayName.maybeHandleOverflow(maxChars: 10),
                                                                                                      textAlign: TextAlign.center,
                                                                                                      maxLines: 3,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'YuPearl',
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) {
                                                                                                if (stackPostRecord.hasPostCourseInfo2()) {
                                                                                                  return Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                    child: SingleChildScrollView(
                                                                                                      primary: false,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 23.0, 0.0),
                                                                                                            child: AutoSizeText(
                                                                                                              stackPostRecord.postCourseNameForSearch.maybeHandleOverflow(
                                                                                                                maxChars: 6,
                                                                                                                replacement: '…',
                                                                                                              ),
                                                                                                              textAlign: TextAlign.start,
                                                                                                              maxLines: 3,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'YuPearl',
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 23.0, 0.0),
                                                                                                            child: Text(
                                                                                                              stackPostRecord.postCourseProNameForsearch.maybeHandleOverflow(maxChars: 6),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              maxLines: 1,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'YuPearl',
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(const SizedBox(height: 2.0)).around(const SizedBox(height: 2.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
                                                                                                  return Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                                                                                                    child: SingleChildScrollView(
                                                                                                      primary: false,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                            child: Text(
                                                                                                              ' ',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'YuPearl',
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(const SizedBox(height: 2.0)).around(const SizedBox(height: 2.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                const Color(0x00FFFFFF),
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                const Color(0x00F7F7F7),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_control,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('U_HIDE_POST_AND_USERkeyboard_control_ICN');
                                                                              logFirebaseEvent('IconButton_update_page_state');
                                                                              _model.showSharebottom = true;
                                                                              _model.tempclickPost = stackPostRecord.reference;
                                                                              setState(() {});
                                                                            },
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          stackPostRecord
                                                                              .postText,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'YuPearl',
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (stackPostRecord.postPhoto !=
                                                                              '')
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              15.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (valueOrDefault<bool>(
                                                                                stackPostRecord.postPhoto != '',
                                                                                true,
                                                                              )) {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.network(
                                                                                    stackPostRecord.postPhoto,
                                                                                    width: 300.0,
                                                                                    height: 200.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return Container(
                                                                                  width: double.infinity,
                                                                                  height: 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                      if (stackPostRecord
                                                                              .hasLimitPeopleNum() &&
                                                                          (stackPostRecord.limitPeopleNum !=
                                                                              0))
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.people_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '人限',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'YuPearl',
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  stackPostRecord.limitPeopleNum.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'YuPearl',
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (stackPostRecord
                                                                          .hasPostInfoMoney())
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              1.0,
                                                                              5.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.attach_money_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 18.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '賞金',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'YuPearl',
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  stackPostRecord.postInfoMoney,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'YuPearl',
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Text(
                                                                                  dateTimeFormat(
                                                                                    'relative',
                                                                                    stackPostRecord.postTime!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'YuPearl',
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const Opacity(
                                                                  opacity: 0.7,
                                                                  child:
                                                                      Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xFFDBDCDE),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if ((_model.showSharebottom ==
                                                              true) &&
                                                          (stackPostRecord
                                                                  .reference ==
                                                              _model
                                                                  .tempclickPost))
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.63, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        31.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 97.0,
                                                              height: 94.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0x9B9E9D9D),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          50.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('U_HIDE_POST_AND_USER舉報_BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_navigate_to');

                                                                              context.pushNamed(
                                                                                'repoetoffensive',
                                                                                queryParameters: {
                                                                                  'postReport': serializeParam(
                                                                                    stackPostRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            text:
                                                                                '舉報',
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.warning_sharp,
                                                                              size: 15.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 30.0,
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 1.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                              elevation: 3.0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('U_HIDE_POST_AND_USER解除_BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_backend_call');

                                                                              await currentUserReference!.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'hide_post': FieldValue.arrayRemove([
                                                                                      stackPostRecord.reference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              logFirebaseEvent('Button_custom_action');
                                                                              _model.updateHidepost = await actions.removedatetype(
                                                                                (currentUserDocument?.hidePostTimeCo.toList() ?? []).toList(),
                                                                                stackPostRecord.reference,
                                                                              );
                                                                              logFirebaseEvent('Button_backend_call');

                                                                              await currentUserReference!.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'hide_post_time_co': getPostWithTimeListFirestoreData(
                                                                                      _model.updateHidepost,
                                                                                    ),
                                                                                  },
                                                                                ),
                                                                              });

                                                                              setState(() {});
                                                                            },
                                                                            text:
                                                                                '解除',
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.check_sharp,
                                                                              size: 15.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 30.0,
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 1.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                              elevation: 3.0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation1']!),
                                                          ),
                                                        ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Builder(
                              builder: (context) {
                                final blockUser =
                                    (currentUserDocument?.blockUser.toList() ??
                                            [])
                                        .toList();
                                if (blockUser.isEmpty) {
                                  return Center(
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: EmptyStateSimpleWidget(
                                        icon: Icon(
                                          Icons.block_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 90.0,
                                        ),
                                        title: 'No Block Users',
                                        body: ' ',
                                      ),
                                    ),
                                  );
                                }
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'U_HIDE_POST_AND_USERListView_1khjnsu6_ON');
                                    logFirebaseEvent(
                                        'ListView_update_page_state');
                                    _model.showblockuser = false;
                                    setState(() {});
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: blockUser.length,
                                    itemBuilder: (context, blockUserIndex) {
                                      final blockUserItem =
                                          blockUser[blockUserIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 0.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: FFAppState().blockUser(
                                            uniqueQueryKey: blockUserItem.id,
                                            requestFn: () =>
                                                UsersRecord.getDocument(
                                                    blockUserItem),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final containerUsersRecord =
                                                snapshot.data!;
                                            return Material(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      offset: const Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'U_HIDE_POST_AND_USERColumn_l6zyp1qc_ON_T');
                                                                logFirebaseEvent(
                                                                    'Column_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'link_userprofile',
                                                                  queryParameters:
                                                                      {
                                                                    'profileUserRef':
                                                                        serializeParam(
                                                                      blockUserItem,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (containerUsersRecord.photoUrl !=
                                                                                '') {
                                                                          return Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(2.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: const Duration(milliseconds: 200),
                                                                                    fadeOutDuration: const Duration(milliseconds: 200),
                                                                                    imageUrl: containerUsersRecord.photoUrl,
                                                                                    width: double.infinity,
                                                                                    height: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (functions.verifyemail(containerUsersRecord.email) == true)
                                                                                const Align(
                                                                                  alignment: AlignmentDirectional(1.0, 1.0),
                                                                                  child: Icon(
                                                                                    Icons.check_circle_rounded,
                                                                                    color: Color(0xFF42BAF1),
                                                                                    size: 12.0,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          );
                                                                        } else {
                                                                          return Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(2.0),
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: const Icon(
                                                                                    Icons.person_rounded,
                                                                                    color: Color(0xD614181B),
                                                                                    size: 29.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (functions.verifyemail(containerUsersRecord.email) == true)
                                                                                const Align(
                                                                                  alignment: AlignmentDirectional(1.0, 1.0),
                                                                                  child: Icon(
                                                                                    Icons.check_circle_rounded,
                                                                                    color: Color(0xFF42BAF1),
                                                                                    size: 12.0,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'U_HIDE_POST_AND_USERColumn_9lcyiswm_ON_T');
                                                                  logFirebaseEvent(
                                                                      'Column_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'link_userprofile',
                                                                    queryParameters:
                                                                        {
                                                                      'profileUserRef':
                                                                          serializeParam(
                                                                        blockUserItem,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              containerUsersRecord.displayName,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        containerUsersRecord
                                                                            .role,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'YuPearl',
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            containerUsersRecord.shortDescription,
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'YuPearl',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 16.0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                icon: Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'U_HIDE_POST_AND_USERmore_vert_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_update_page_state');
                                                                  _model.tempclickuser =
                                                                      containerUsersRecord
                                                                          .reference;
                                                                  _model.showblockuser =
                                                                      true;
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (_model.showblockuser &&
                                                        (_model.tempclickuser ==
                                                            containerUsersRecord
                                                                .reference))
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.63, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      31.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 97.0,
                                                            height: 50.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0x9B9E9D9D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        30.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('U_HIDE_POST_AND_USER解除_BTN_ON_TAP');
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'block_user': FieldValue.arrayRemove([
                                                                                    containerUsersRecord.reference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            logFirebaseEvent('Button_update_page_state');

                                                                            setState(() {});
                                                                          },
                                                                          text:
                                                                              '解除',
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.check_sharp,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                3.0,
                                                                                0.0,
                                                                                3.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'YuPearl',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 1.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation2']!),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
