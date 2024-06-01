import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'detailinvitepage_model.dart';
export 'detailinvitepage_model.dart';

class DetailinvitepageWidget extends StatefulWidget {
  const DetailinvitepageWidget({
    super.key,
    required this.invitebyotherdetail,
  });

  final DocumentReference? invitebyotherdetail;

  @override
  State<DetailinvitepageWidget> createState() => _DetailinvitepageWidgetState();
}

class _DetailinvitepageWidgetState extends State<DetailinvitepageWidget>
    with TickerProviderStateMixin {
  late DetailinvitepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailinvitepageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detailinvitepage'});
    animationsMap.addAll({
      'mouseRegionOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.524, 0),
            end: const Offset(0, 0),
          ),
        ],
      ),
      'mouseRegionOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.524, 0),
            end: const Offset(0, 0),
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
    return StreamBuilder<InviteAskListRecord>(
      stream: InviteAskListRecord.getDocument(widget.invitebyotherdetail!),
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
        final detailinvitepageInviteAskListRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).info,
            body: SafeArea(
              top: true,
              child: StreamBuilder<PostRecord>(
                stream: PostRecord.getDocument(
                    detailinvitepageInviteAskListRecord.invPost!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  final stackPostRecord = snapshot.data!;
                  return Stack(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'DETAILINVITEColumn_qoy0l3ai_ON_TAP');
                          logFirebaseEvent('Column_update_page_state');
                          _model.declineshow = false;
                          _model.showremoverecord = false;
                          setState(() {});
                        },
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'DETAILINVITEchevron_left_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.safePop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                if (detailinvitepageInviteAskListRecord
                                        .inviteStatus ==
                                    2)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 30.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DETAILINVITEPAGE_PAGE_婉拒_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.declineshow = true;
                                              _model.showremoverecord = false;
                                              setState(() {});
                                            },
                                            text: '婉拒',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DETAILINVITEPAGE_PAGE_同意_BTN_ON_TAP');
                                              if (stackPostRecord.chatOfPost !=
                                                  null) {
                                                // updateChat
                                                logFirebaseEvent(
                                                    'Button_updateChat');

                                                await stackPostRecord
                                                    .chatOfPost!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'users': FieldValue
                                                          .arrayUnion([
                                                        detailinvitepageInviteAskListRecord
                                                            .sender
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await detailinvitepageInviteAskListRecord
                                                    .reference
                                                    .update(
                                                        createInviteAskListRecordData(
                                                  inviteStatus: 1,
                                                ));
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await stackPostRecord.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'join_member': FieldValue
                                                          .arrayUnion([
                                                        detailinvitepageInviteAskListRecord
                                                            .sender
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                if ((stackPostRecord
                                                            .limitPeopleNum ==
                                                        null) ||
                                                    (stackPostRecord
                                                            .limitPeopleNum ==
                                                        0)) {
                                                  logFirebaseEvent(
                                                      'Button_firestore_query');
                                                  _model.photoQueryinv =
                                                      await queryInvAskListRecordOnce(
                                                    parent: stackPostRecord
                                                        .reference,
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  await _model
                                                      .photoQueryinv!.reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'inv_ask_member':
                                                            FieldValue
                                                                .arrayRemove([
                                                          detailinvitepageInviteAskListRecord
                                                              .sender
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  logFirebaseEvent(
                                                      'Button_firestore_query');
                                                  _model.queryfromIDchat =
                                                      await queryChatsRecordOnce(
                                                    queryBuilder:
                                                        (chatsRecord) =>
                                                            chatsRecord.where(
                                                      'group_chat_id',
                                                      isEqualTo: stackPostRecord
                                                          .chatOfPostID,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.goNamed(
                                                    'chat_2_Details',
                                                    queryParameters: {
                                                      'chatRef': serializeParam(
                                                        _model.queryfromIDchat,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'chatRef': _model
                                                          .queryfromIDchat,
                                                    },
                                                  );

                                                  logFirebaseEvent(
                                                      'Button_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        'Connextion ',
                                                    notificationText:
                                                        '您的申請已核准  已加入 ${stackPostRecord.postChatName}  聊天室',
                                                    notificationSound:
                                                        'default',
                                                    userRefs: [
                                                      detailinvitepageInviteAskListRecord
                                                          .sender!
                                                    ],
                                                    initialPageName:
                                                        'chat_2_Details',
                                                    parameterData: {
                                                      'chatRef': _model
                                                          .queryfromIDchat,
                                                    },
                                                  );
                                                } else {
                                                  if (stackPostRecord
                                                          .joinMember.length >=
                                                      functions.minus1(
                                                          stackPostRecord
                                                              .limitPeopleNum)) {
                                                    logFirebaseEvent(
                                                        'Button_firestore_query');
                                                    _model.photoQueryinvChangepeople =
                                                        await queryInvAskListRecordOnce(
                                                      parent: stackPostRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await _model
                                                        .photoQueryinvChangepeople!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'inv_ask_member':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            detailinvitepageInviteAskListRecord
                                                                .sender
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await stackPostRecord
                                                        .reference
                                                        .update(
                                                            createPostRecordData(
                                                      postStatus: false,
                                                    ));
                                                    logFirebaseEvent(
                                                        'Button_firestore_query');
                                                    _model.queryfromIDchatChangepeople =
                                                        await queryChatsRecordOnce(
                                                      queryBuilder:
                                                          (chatsRecord) =>
                                                              chatsRecord.where(
                                                        'group_chat_id',
                                                        isEqualTo:
                                                            stackPostRecord
                                                                .chatOfPostID,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.goNamed(
                                                      'chat_2_Details',
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          _model
                                                              .queryfromIDchatChangepeople,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatRef': _model
                                                            .queryfromIDchatChangepeople,
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'Button_trigger_push_notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Connextion ',
                                                      notificationText:
                                                          '您的申請已核准  已加入 ${stackPostRecord.postChatName}  聊天室',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        detailinvitepageInviteAskListRecord
                                                            .sender!
                                                      ],
                                                      initialPageName:
                                                          'chat_2_Details',
                                                      parameterData: {
                                                        'chatRef': _model
                                                            .queryfromIDchatChangepeople,
                                                      },
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_firestore_query');
                                                    _model.photoQueryinvNopeoplechange =
                                                        await queryInvAskListRecordOnce(
                                                      parent: stackPostRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await _model
                                                        .photoQueryinvNopeoplechange!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'inv_ask_member':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            detailinvitepageInviteAskListRecord
                                                                .sender
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_firestore_query');
                                                    _model.queryfromIDchatNopeoplechange =
                                                        await queryChatsRecordOnce(
                                                      queryBuilder:
                                                          (chatsRecord) =>
                                                              chatsRecord.where(
                                                        'group_chat_id',
                                                        isEqualTo:
                                                            stackPostRecord
                                                                .chatOfPostID,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.goNamed(
                                                      'chat_2_Details',
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          _model
                                                              .queryfromIDchatNopeoplechange,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatRef': _model
                                                            .queryfromIDchatNopeoplechange,
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'Button_trigger_push_notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Connextion ',
                                                      notificationText:
                                                          '您的申請已核准  已加入 ${stackPostRecord.postChatName}  聊天室',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        detailinvitepageInviteAskListRecord
                                                            .sender!
                                                      ],
                                                      initialPageName:
                                                          'chat_2_Details',
                                                      parameterData: {
                                                        'chatRef': _model
                                                            .queryfromIDchatNopeoplechange,
                                                      },
                                                    );
                                                  }
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.addToFirst2user(
                                                    currentUserReference!);
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.addToFirst2user(
                                                    detailinvitepageInviteAskListRecord
                                                        .sender!);
                                                // newChat
                                                logFirebaseEvent(
                                                    'Button_newChat');

                                                var chatsRecordReference =
                                                    ChatsRecord.collection
                                                        .doc();
                                                await chatsRecordReference.set({
                                                  ...createChatsRecordData(
                                                    userA: currentUserReference,
                                                    userB:
                                                        detailinvitepageInviteAskListRecord
                                                            .sender,
                                                    lastMessage: '',
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    groupChatId: stackPostRecord
                                                        .chatOfPostID,
                                                    postOfChat: stackPostRecord
                                                        .reference,
                                                    chatName: stackPostRecord
                                                        .postChatName,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'users':
                                                          _model.first2user,
                                                    },
                                                  ),
                                                });
                                                _model.newChatInvite =
                                                    ChatsRecord
                                                        .getDocumentFromData({
                                                  ...createChatsRecordData(
                                                    userA: currentUserReference,
                                                    userB:
                                                        detailinvitepageInviteAskListRecord
                                                            .sender,
                                                    lastMessage: '',
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    groupChatId: stackPostRecord
                                                        .chatOfPostID,
                                                    postOfChat: stackPostRecord
                                                        .reference,
                                                    chatName: stackPostRecord
                                                        .postChatName,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'users':
                                                          _model.first2user,
                                                    },
                                                  ),
                                                }, chatsRecordReference);
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await stackPostRecord.reference
                                                    .update({
                                                  ...createPostRecordData(
                                                    chatOfPost: _model
                                                        .newChatInvite
                                                        ?.reference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'join_member': FieldValue
                                                          .arrayUnion([
                                                        detailinvitepageInviteAskListRecord
                                                            .sender
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                if ((stackPostRecord
                                                            .limitPeopleNum ==
                                                        null) ||
                                                    (stackPostRecord
                                                            .limitPeopleNum ==
                                                        0)) {
                                                  logFirebaseEvent(
                                                      'Button_firestore_query');
                                                  _model.nophotoQueryinv =
                                                      await queryInvAskListRecordOnce(
                                                    parent: stackPostRecord
                                                        .reference,
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  await _model.nophotoQueryinv!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'inv_ask_member':
                                                            FieldValue
                                                                .arrayRemove([
                                                          detailinvitepageInviteAskListRecord
                                                              .sender
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  await detailinvitepageInviteAskListRecord
                                                      .reference
                                                      .update(
                                                          createInviteAskListRecordData(
                                                    inviteStatus: 1,
                                                  ));
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.goNamed(
                                                    'chat_2_Details',
                                                    queryParameters: {
                                                      'chatRef': serializeParam(
                                                        _model.newChatInvite,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'chatRef':
                                                          _model.newChatInvite,
                                                    },
                                                  );

                                                  logFirebaseEvent(
                                                      'Button_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        'Connextion ',
                                                    notificationText:
                                                        '您的申請已核准  已加入 ${stackPostRecord.postChatName}  聊天室',
                                                    notificationSound:
                                                        'default',
                                                    userRefs: [
                                                      detailinvitepageInviteAskListRecord
                                                          .sender!
                                                    ],
                                                    initialPageName:
                                                        'chat_2_Details',
                                                    parameterData: {
                                                      'chatRef':
                                                          _model.newChatInvite,
                                                    },
                                                  );
                                                } else {
                                                  if (stackPostRecord
                                                          .joinMember.length >=
                                                      functions.minus1(
                                                          stackPostRecord
                                                              .limitPeopleNum)) {
                                                    logFirebaseEvent(
                                                        'Button_firestore_query');
                                                    _model.nophotoQueryinvPeoplechange =
                                                        await queryInvAskListRecordOnce(
                                                      parent: stackPostRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await _model
                                                        .nophotoQueryinvPeoplechange!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'inv_ask_member':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            detailinvitepageInviteAskListRecord
                                                                .sender
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await detailinvitepageInviteAskListRecord
                                                        .reference
                                                        .update(
                                                            createInviteAskListRecordData(
                                                      inviteStatus: 1,
                                                    ));
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await stackPostRecord
                                                        .reference
                                                        .update(
                                                            createPostRecordData(
                                                      postStatus: false,
                                                    ));
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.goNamed(
                                                      'chat_2_Details',
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          _model.newChatInvite,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatRef': _model
                                                            .newChatInvite,
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'Button_trigger_push_notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Connextion ',
                                                      notificationText:
                                                          '您的申請已核准  已加入 ${stackPostRecord.postChatName}  聊天室',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        detailinvitepageInviteAskListRecord
                                                            .sender!
                                                      ],
                                                      initialPageName:
                                                          'chat_2_Details',
                                                      parameterData: {
                                                        'chatRef': _model
                                                            .newChatInvite,
                                                      },
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_firestore_query');
                                                    _model.nophotoQueryinvNopeoplechange =
                                                        await queryInvAskListRecordOnce(
                                                      parent: stackPostRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await _model
                                                        .nophotoQueryinvNopeoplechange!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'inv_ask_member':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            detailinvitepageInviteAskListRecord
                                                                .sender
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await detailinvitepageInviteAskListRecord
                                                        .reference
                                                        .update(
                                                            createInviteAskListRecordData(
                                                      inviteStatus: 1,
                                                    ));
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.goNamed(
                                                      'chat_2_Details',
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          _model.newChatInvite,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatRef': _model
                                                            .newChatInvite,
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'Button_trigger_push_notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Connextion ',
                                                      notificationText:
                                                          '您的申請已核准  已加入 ${stackPostRecord.postChatName}  聊天室',
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        detailinvitepageInviteAskListRecord
                                                            .sender!
                                                      ],
                                                      initialPageName:
                                                          'chat_2_Details',
                                                      parameterData: {
                                                        'chatRef': _model
                                                            .newChatInvite,
                                                      },
                                                    );
                                                  }
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: '同意',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFF42BAF1),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'YuPearl',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Color(0xFF42BAF1),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 0.0),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        detailinvitepageInviteAskListRecord
                                            .sender!),
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
                                      final rowUsersRecord = snapshot.data!;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'DETAILINVITERow_hegdsaq9_ON_TAP');
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
                                            Builder(
                                              builder: (context) {
                                                if (rowUsersRecord.photoUrl !=
                                                        '') {
                                                  return Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 1.0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
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
                                                  return Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 1.0),
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
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
                                                }
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                rowUsersRecord.displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        height: 200.0,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 2.0, 5.0, 2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      detailinvitepageInviteAskListRecord
                                                          .senderIntro,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'YuPearl',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Opacity(
                                            opacity: 0.4,
                                            child: Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (detailinvitepageInviteAskListRecord
                                                      .inviteIntroPhoto !=
                                                  '')
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  detailinvitepageInviteAskListRecord
                                                      .inviteIntroPhoto,
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (detailinvitepageInviteAskListRecord
                                                  .inviteStatus ==
                                              0)
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              icon: Icon(
                                                Icons.delete_forever,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'DETAILINVITEdelete_forever_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_update_page_state');
                                                _model.showremoverecord = true;
                                                _model.declineshow = false;
                                                setState(() {});
                                              },
                                            ),
                                          Text(
                                            dateTimeFormat(
                                              'relative',
                                              detailinvitepageInviteAskListRecord
                                                  .sendTime!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
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
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    if (_model.declineshow == true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: SystemMouseCursors.click ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered1 = true);
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered1 = false);
                                            }),
                                            child: AnimatedContainer(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.easeInOut,
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE2E5ED),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              '確定婉拒？',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons
                                                            .check_circle_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'DETAILINVITEcheck_circle_outline_ICN_ON_');
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await widget
                                                            .invitebyotherdetail!
                                                            .update(
                                                                createInviteAskListRecordData(
                                                          inviteStatus: 0,
                                                        ));
                                                        logFirebaseEvent(
                                                            'IconButton_firestore_query');
                                                        _model.queryinv =
                                                            await queryInvAskListRecordOnce(
                                                          parent:
                                                              stackPostRecord
                                                                  .reference,
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await _model
                                                            .queryinv!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'inv_ask_member':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                detailinvitepageInviteAskListRecord
                                                                    .sender
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.pushNamed(
                                                            'invitepage');

                                                        logFirebaseEvent(
                                                            'IconButton_trigger_push_notification');
                                                        triggerPushNotification(
                                                          notificationTitle:
                                                              'Connextion ',
                                                          notificationText:
                                                              '您的申請被婉拒',
                                                          notificationSound:
                                                              'default',
                                                          userRefs: [
                                                            detailinvitepageInviteAskListRecord
                                                                .sender!
                                                          ],
                                                          initialPageName:
                                                              'youraskviewpage',
                                                          parameterData: {},
                                                        );

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'mouseRegionOnPageLoadAnimation1']!),
                                        ],
                                      ),
                                    if (_model.showremoverecord == true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          MouseRegion(
                                            opaque: false,
                                            cursor: SystemMouseCursors.click ??
                                                MouseCursor.defer,
                                            onEnter: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered2 = true);
                                            }),
                                            onExit: ((event) async {
                                              setState(() => _model
                                                  .mouseRegionHovered2 = false);
                                            }),
                                            child: AnimatedContainer(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.easeInOut,
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFDFE2E8),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              '確定移除這則申請紀錄？',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons
                                                            .check_circle_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'DETAILINVITEcheck_circle_outline_ICN_ON_');
                                                        logFirebaseEvent(
                                                            'IconButton_firestore_query');
                                                        _model.queryinvdelete =
                                                            await queryInvAskListRecordOnce(
                                                          parent:
                                                              stackPostRecord
                                                                  .reference,
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await _model
                                                            .queryinvdelete!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'inv_ask_member':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                detailinvitepageInviteAskListRecord
                                                                    .sender
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.goNamed(
                                                            'invitepage');

                                                        logFirebaseEvent(
                                                            'IconButton_trigger_push_notification');
                                                        triggerPushNotification(
                                                          notificationTitle:
                                                              'Connextion ',
                                                          notificationText:
                                                              '您的申請被貼文主刪除',
                                                          notificationSound:
                                                              'default',
                                                          userRefs: [
                                                            detailinvitepageInviteAskListRecord
                                                                .sender!
                                                          ],
                                                          initialPageName:
                                                              'youraskviewpage',
                                                          parameterData: {},
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        await widget
                                                            .invitebyotherdetail!
                                                            .delete();

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'mouseRegionOnPageLoadAnimation2']!),
                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
