import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'link_post_model.dart';
export 'link_post_model.dart';

class LinkPostWidget extends StatefulWidget {
  const LinkPostWidget({
    super.key,
    required this.postref,
  });

  final DocumentReference? postref;

  @override
  State<LinkPostWidget> createState() => _LinkPostWidgetState();
}

class _LinkPostWidgetState extends State<LinkPostWidget>
    with TickerProviderStateMixin {
  late LinkPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'link_post'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LINK_POST_PAGE_link_post_ON_INIT_STATE');
      if ((currentUserDocument?.lovePostCollection.toList() ?? [])
          .contains(widget.postref)) {
        logFirebaseEvent('link_post_update_page_state');
        _model.iscollection = true;
        setState(() {});
      } else {
        logFirebaseEvent('link_post_update_page_state');
        _model.iscollection = false;
        setState(() {});
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
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
    return StreamBuilder<PostRecord>(
      stream: PostRecord.getDocument(widget.postref!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).info,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final linkPostPostRecord = snapshot.data!;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).accent1,
                              borderRadius: 12.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LINK_POST_PAGE_chevron_left_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).accent1,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 38.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.ios_share,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 23.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LINK_POST_PAGE_ios_share_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_share');
                                  await Share.share(
                                    'connextion://connextiontw.com${GoRouterState.of(context).uri.toString()}',
                                    sharePositionOrigin:
                                        getWidgetBoundingBox(context),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 8.0, 18.0, 0.0),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  linkPostPostRecord.postUser!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final rowUsersRecord = snapshot.data!;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LINK_POST_PAGE_Row_kxs7qr0x_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

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
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                if (rowUsersRecord.photoUrl !=
                                                        '') {
                                                  return Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 1.0),
                                                    children: [
                                                      Container(
                                                        width: 45.0,
                                                        height: 45.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          rowUsersRecord
                                                              .photoUrl,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      if (functions.verifyemail(
                                                              rowUsersRecord
                                                                  .email) ==
                                                          true)
                                                        const Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              Color(0xFF42BAF1),
                                                          size: 12.0,
                                                        ),
                                                    ],
                                                  );
                                                } else {
                                                  return Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Icon(
                                                            Icons.person,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 26.0,
                                                          ),
                                                        ),
                                                        if (functions.verifyemail(
                                                                rowUsersRecord
                                                                    .email) ==
                                                            true)
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: Icon(
                                                              Icons
                                                                  .check_circle_rounded,
                                                              color: Color(
                                                                  0xFF42BAF1),
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
                                          Text(
                                            rowUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'YuPearl',
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        if (_model.iscollection)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'LINK_POST_PAGE_Container_3ugac4qs_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.iscollection = false;
                                              setState(() {});
                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'love_post_collection':
                                                        FieldValue.arrayRemove(
                                                            [widget.postref]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              _model.outputCollectionList =
                                                  await actions.removedatetype(
                                                (currentUserDocument
                                                            ?.postCollection
                                                            .toList() ??
                                                        [])
                                                    .toList(),
                                                widget.postref,
                                              );
                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'Post_collection':
                                                        getPostWithTimeListFirestoreData(
                                                      _model
                                                          .outputCollectionList,
                                                    ),
                                                  },
                                                ),
                                              });

                                              setState(() {});
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Icon(
                                                Icons.favorite,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 24.0,
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                        if (!_model.iscollection)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'LINK_POST_PAGE_Container_5983osfw_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.iscollection = true;
                                              setState(() {});
                                              logFirebaseEvent(
                                                  'Container_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'love_post_collection':
                                                        FieldValue.arrayUnion(
                                                            [widget.postref]),
                                                    'Post_collection':
                                                        FieldValue.arrayUnion([
                                                      getPostWithTimeFirestoreData(
                                                        updatePostWithTimeStruct(
                                                          PostWithTimeStruct(
                                                            postCollection:
                                                                widget.postref,
                                                            addTime:
                                                                getCurrentTimestamp,
                                                          ),
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                  },
                                                ),
                                              });
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Icon(
                                                Icons.favorite_border,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation2']!),
                                      ],
                                    ),
                                  ].divide(const SizedBox(width: 15.0)),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  linkPostPostRecord.postText,
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
                          ),
                          if (linkPostPostRecord.postPhoto != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LINK_POST_PAGE_Image_ci9k2zul_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                linkPostPostRecord.postPhoto,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: linkPostPostRecord.postPhoto,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: linkPostPostRecord.postPhoto,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            linkPostPostRecord.postPhoto,
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (linkPostPostRecord
                                          .hasPostCourseInfo2()) {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 10.0, 25.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                linkPostPostRecord
                                                    .postCourseNameForSearch,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Text(
                                                linkPostPostRecord
                                                    .postCourseProNameForsearch
                                                    .maybeHandleOverflow(
                                                        maxChars: 10),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                ' ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (linkPostPostRecord.hasLimitPeopleNum() &&
                              (linkPostPostRecord.limitPeopleNum != 0))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.people_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 16.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '人限',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'YuPearl',
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '${linkPostPostRecord.joinMember.length.toString()}/${linkPostPostRecord.limitPeopleNum.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
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
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 20.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (linkPostPostRecord.postStatus == true) {
                                    return StreamBuilder<
                                        List<InvAskListRecord>>(
                                      stream: FFAppState().invMemberSaftyMode(
                                        uniqueQueryKey:
                                            linkPostPostRecord.reference.id,
                                        requestFn: () => queryInvAskListRecord(
                                          parent: linkPostPostRecord.reference,
                                          singleRecord: true,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<InvAskListRecord>
                                            conditionalBuilderInvAskListRecordList =
                                            snapshot.data!;
                                        final conditionalBuilderInvAskListRecord =
                                            conditionalBuilderInvAskListRecordList
                                                    .isNotEmpty
                                                ? conditionalBuilderInvAskListRecordList
                                                    .first
                                                : null;
                                        return Builder(
                                          builder: (context) {
                                            if (conditionalBuilderInvAskListRecord !=
                                                null) {
                                              return Builder(
                                                builder: (context) {
                                                  if (conditionalBuilderInvAskListRecord
                                                          .invAskMember
                                                          .contains(
                                                              currentUserReference) ==
                                                      true) {
                                                    return FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: '待審核',
                                                      options: FFButtonOptions(
                                                        width: 90.0,
                                                        height: 25.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            const Color(0x2157636C),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    );
                                                  } else {
                                                    return Builder(
                                                      builder: (context) {
                                                        if (linkPostPostRecord
                                                                .joinMember
                                                                .contains(
                                                                    currentUserReference) &&
                                                            (linkPostPostRecord
                                                                    .postUser !=
                                                                currentUserReference)) {
                                                          return FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: '已加入',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 90.0,
                                                              height: 25.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: const Color(
                                                                  0x2157636C),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'YuPearl',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                          );
                                                        } else {
                                                          return Builder(
                                                            builder: (context) {
                                                              if (linkPostPostRecord
                                                                      .needApply ||
                                                                  (linkPostPostRecord
                                                                          .hasNeedApply() ==
                                                                      false)) {
                                                                return FFButtonWidget(
                                                                  onPressed: ((linkPostPostRecord.postUser ==
                                                                              currentUserReference) ||
                                                                          !linkPostPostRecord
                                                                              .postStatus ||
                                                                          linkPostPostRecord
                                                                              .joinMember
                                                                              .contains(currentUserReference))
                                                                      ? null
                                                                      : () async {
                                                                          logFirebaseEvent(
                                                                              'LINK_POST_PAGE_申請_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'joinpage',
                                                                            queryParameters:
                                                                                {
                                                                              'postchosed': serializeParam(
                                                                                linkPostPostRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                  text: '申請',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 90.0,
                                                                    height:
                                                                        25.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: const Color(
                                                                        0xFF42BAF1),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'YuPearl',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    disabledColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                    disabledTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  ),
                                                                );
                                                              } else {
                                                                return FFButtonWidget(
                                                                  onPressed: ((linkPostPostRecord.postUser ==
                                                                              currentUserReference) ||
                                                                          !linkPostPostRecord
                                                                              .postStatus ||
                                                                          linkPostPostRecord
                                                                              .joinMember
                                                                              .contains(currentUserReference))
                                                                      ? null
                                                                      : () async {
                                                                          logFirebaseEvent(
                                                                              'LINK_POST_PAGE_加入_BTN_ON_TAP');
                                                                          if (linkPostPostRecord.chatOfPost !=
                                                                              null) {
                                                                            // updateChat
                                                                            logFirebaseEvent('Button_updateChat');

                                                                            await linkPostPostRecord.chatOfPost!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'users': FieldValue.arrayUnion([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            await linkPostPostRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'join_member': FieldValue.arrayUnion([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            logFirebaseEvent('Button_custom_action');
                                                                            _model.chatdocdetail =
                                                                                await actions.getDocReffromchat(
                                                                              linkPostPostRecord.chatOfPost!,
                                                                            );
                                                                            logFirebaseEvent('Button_navigate_to');

                                                                            context.goNamed(
                                                                              'chat_2_Details',
                                                                              queryParameters: {
                                                                                'chatRef': serializeParam(
                                                                                  _model.chatdocdetail,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'chatRef': _model.chatdocdetail,
                                                                              },
                                                                            );

                                                                            logFirebaseEvent('Button_trigger_push_notification');
                                                                            triggerPushNotification(
                                                                              notificationTitle: 'Connextion ',
                                                                              notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                              notificationSound: 'default',
                                                                              userRefs: [
                                                                                linkPostPostRecord.postUser!
                                                                              ],
                                                                              initialPageName: 'chat_2_Details',
                                                                              parameterData: {
                                                                                'chatRef': _model.chatdocdetail,
                                                                              },
                                                                            );
                                                                          } else {
                                                                            // newChat
                                                                            logFirebaseEvent('Button_newChat');

                                                                            var chatsRecordReference =
                                                                                ChatsRecord.collection.doc();
                                                                            await chatsRecordReference.set({
                                                                              ...createChatsRecordData(
                                                                                userA: linkPostPostRecord.postUser,
                                                                                userB: currentUserReference,
                                                                                lastMessage: '',
                                                                                lastMessageTime: getCurrentTimestamp,
                                                                                groupChatId: linkPostPostRecord.chatOfPostID,
                                                                                postOfChat: linkPostPostRecord.reference,
                                                                                chatName: linkPostPostRecord.postChatName,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'users': [
                                                                                    linkPostPostRecord.postUser
                                                                                  ],
                                                                                },
                                                                              ),
                                                                            });
                                                                            _model.newChatdetail =
                                                                                ChatsRecord.getDocumentFromData({
                                                                              ...createChatsRecordData(
                                                                                userA: linkPostPostRecord.postUser,
                                                                                userB: currentUserReference,
                                                                                lastMessage: '',
                                                                                lastMessageTime: getCurrentTimestamp,
                                                                                groupChatId: linkPostPostRecord.chatOfPostID,
                                                                                postOfChat: linkPostPostRecord.reference,
                                                                                chatName: linkPostPostRecord.postChatName,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'users': [
                                                                                    linkPostPostRecord.postUser
                                                                                  ],
                                                                                },
                                                                              ),
                                                                            }, chatsRecordReference);
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            await linkPostPostRecord.reference.update({
                                                                              ...createPostRecordData(
                                                                                chatOfPost: _model.newChatdetail?.reference,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'join_member': FieldValue.arrayUnion([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            logFirebaseEvent('Button_navigate_to');

                                                                            context.goNamed(
                                                                              'chat_2_Details',
                                                                              queryParameters: {
                                                                                'chatRef': serializeParam(
                                                                                  _model.newChatdetail,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'chatRef': _model.newChatdetail,
                                                                              },
                                                                            );

                                                                            logFirebaseEvent('Button_trigger_push_notification');
                                                                            triggerPushNotification(
                                                                              notificationTitle: 'Connextion ',
                                                                              notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                              notificationSound: 'default',
                                                                              userRefs: [
                                                                                linkPostPostRecord.postUser!
                                                                              ],
                                                                              initialPageName: 'chat_2_Details',
                                                                              parameterData: {
                                                                                'chatRef': _model.newChatdetail,
                                                                              },
                                                                            );
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                  text: '加入',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 90.0,
                                                                    height:
                                                                        25.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: const Color(
                                                                        0xFF42BAF1),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'YuPearl',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    disabledColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                    disabledTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                        }
                                                      },
                                                    );
                                                  }
                                                },
                                              );
                                            } else {
                                              return Builder(
                                                builder: (context) {
                                                  if (linkPostPostRecord
                                                          .joinMember
                                                          .contains(
                                                              currentUserReference) &&
                                                      (linkPostPostRecord
                                                              .postUser !=
                                                          currentUserReference)) {
                                                    return FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: '已加入',
                                                      options: FFButtonOptions(
                                                        width: 90.0,
                                                        height: 25.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            const Color(0x2157636C),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    );
                                                  } else {
                                                    return Builder(
                                                      builder: (context) {
                                                        if (linkPostPostRecord
                                                                .needApply ||
                                                            (linkPostPostRecord
                                                                    .hasNeedApply() ==
                                                                false)) {
                                                          return FFButtonWidget(
                                                            onPressed: ((linkPostPostRecord
                                                                            .postUser ==
                                                                        currentUserReference) ||
                                                                    !linkPostPostRecord
                                                                        .postStatus ||
                                                                    linkPostPostRecord
                                                                        .joinMember
                                                                        .contains(
                                                                            currentUserReference))
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'LINK_POST_PAGE_申請_BTN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'joinpage',
                                                                      queryParameters:
                                                                          {
                                                                        'postchosed':
                                                                            serializeParam(
                                                                          linkPostPostRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                            text: '申請',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 90.0,
                                                              height: 25.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: const Color(
                                                                  0xFF42BAF1),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'YuPearl',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                          );
                                                        } else {
                                                          return FFButtonWidget(
                                                            onPressed: ((linkPostPostRecord
                                                                            .postUser ==
                                                                        currentUserReference) ||
                                                                    !linkPostPostRecord
                                                                        .postStatus ||
                                                                    linkPostPostRecord
                                                                        .joinMember
                                                                        .contains(
                                                                            currentUserReference))
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'LINK_POST_PAGE_加入_BTN_ON_TAP');
                                                                    if (linkPostPostRecord
                                                                            .chatOfPost !=
                                                                        null) {
                                                                      // updateChat
                                                                      logFirebaseEvent(
                                                                          'Button_updateChat');

                                                                      await linkPostPostRecord
                                                                          .chatOfPost!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'users':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');

                                                                      await linkPostPostRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'join_member':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Button_custom_action');
                                                                      _model.chatdocdetail2 =
                                                                          await actions
                                                                              .getDocReffromchat(
                                                                        linkPostPostRecord
                                                                            .chatOfPost!,
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .goNamed(
                                                                        'chat_2_Details',
                                                                        queryParameters:
                                                                            {
                                                                          'chatRef':
                                                                              serializeParam(
                                                                            _model.chatdocdetail2,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'chatRef':
                                                                              _model.chatdocdetail2,
                                                                        },
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'Button_trigger_push_notification');
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'Connextion ',
                                                                        notificationText:
                                                                            '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          linkPostPostRecord
                                                                              .postUser!
                                                                        ],
                                                                        initialPageName:
                                                                            'chat_2_Details',
                                                                        parameterData: {
                                                                          'chatRef':
                                                                              _model.chatdocdetail2,
                                                                        },
                                                                      );
                                                                    } else {
                                                                      // newChat
                                                                      logFirebaseEvent(
                                                                          'Button_newChat');

                                                                      var chatsRecordReference = ChatsRecord
                                                                          .collection
                                                                          .doc();
                                                                      await chatsRecordReference
                                                                          .set({
                                                                        ...createChatsRecordData(
                                                                          userA:
                                                                              linkPostPostRecord.postUser,
                                                                          userB:
                                                                              currentUserReference,
                                                                          lastMessage:
                                                                              '',
                                                                          lastMessageTime:
                                                                              getCurrentTimestamp,
                                                                          groupChatId:
                                                                              linkPostPostRecord.chatOfPostID,
                                                                          postOfChat:
                                                                              linkPostPostRecord.reference,
                                                                          chatName:
                                                                              linkPostPostRecord.postChatName,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'users':
                                                                                [
                                                                              linkPostPostRecord.postUser
                                                                            ],
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.newChatdetail2 =
                                                                          ChatsRecord
                                                                              .getDocumentFromData({
                                                                        ...createChatsRecordData(
                                                                          userA:
                                                                              linkPostPostRecord.postUser,
                                                                          userB:
                                                                              currentUserReference,
                                                                          lastMessage:
                                                                              '',
                                                                          lastMessageTime:
                                                                              getCurrentTimestamp,
                                                                          groupChatId:
                                                                              linkPostPostRecord.chatOfPostID,
                                                                          postOfChat:
                                                                              linkPostPostRecord.reference,
                                                                          chatName:
                                                                              linkPostPostRecord.postChatName,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'users':
                                                                                [
                                                                              linkPostPostRecord.postUser
                                                                            ],
                                                                          },
                                                                        ),
                                                                      }, chatsRecordReference);
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');

                                                                      await linkPostPostRecord
                                                                          .reference
                                                                          .update({
                                                                        ...createPostRecordData(
                                                                          chatOfPost: _model
                                                                              .newChatdetail2
                                                                              ?.reference,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'join_member':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .goNamed(
                                                                        'chat_2_Details',
                                                                        queryParameters:
                                                                            {
                                                                          'chatRef':
                                                                              serializeParam(
                                                                            _model.newChatdetail2,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'chatRef':
                                                                              _model.newChatdetail2,
                                                                        },
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'Button_trigger_push_notification');
                                                                      triggerPushNotification(
                                                                        notificationTitle:
                                                                            'Connextion ',
                                                                        notificationText:
                                                                            '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                        notificationSound:
                                                                            'default',
                                                                        userRefs: [
                                                                          linkPostPostRecord
                                                                              .postUser!
                                                                        ],
                                                                        initialPageName:
                                                                            'chat_2_Details',
                                                                        parameterData: {
                                                                          'chatRef':
                                                                              _model.newChatdetail2,
                                                                        },
                                                                      );
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                            text: '加入',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 90.0,
                                                              height: 25.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: const Color(
                                                                  0xFF42BAF1),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'YuPearl',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    );
                                                  }
                                                },
                                              );
                                            }
                                          },
                                        );
                                      },
                                    );
                                  } else {
                                    return FFButtonWidget(
                                      onPressed:
                                          (linkPostPostRecord.postStatus ==
                                                  false)
                                              ? null
                                              : () {
                                                  print('Button pressed ...');
                                                },
                                      text: '已關閉',
                                      options: FFButtonOptions(
                                        width: 90.0,
                                        height: 25.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'YuPearl',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        disabledTextColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        height: 30.0,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'connextion',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Playfair Display',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
