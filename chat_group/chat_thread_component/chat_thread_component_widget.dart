import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/chat_group/chat_thread_update/chat_thread_update_widget.dart';
import '/chat_group/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'chat_thread_component_model.dart';
export 'chat_thread_component_model.dart';

class ChatThreadComponentWidget extends StatefulWidget {
  const ChatThreadComponentWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<ChatThreadComponentWidget> createState() =>
      _ChatThreadComponentWidgetState();
}

class _ChatThreadComponentWidgetState extends State<ChatThreadComponentWidget> {
  late ChatThreadComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatThreadComponentModel());

    _model.textFieldsendTextController ??= TextEditingController();
    _model.textFieldsendFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: StreamBuilder<List<ChatMessagesRecord>>(
              stream: FFAppState().chatMessageTest(
                uniqueQueryKey: widget.chatRef?.reference.id,
                requestFn: () => queryChatMessagesRecord(
                  queryBuilder: (chatMessagesRecord) => chatMessagesRecord
                      .where(
                        'chat',
                        isEqualTo: widget.chatRef?.reference,
                      )
                      .orderBy('timestamp', descending: true),
                  limit: 200,
                ),
              )..listen((snapshot) async {
                  List<ChatMessagesRecord> listViewChatMessagesRecordList =
                      snapshot;
                  if (_model.listViewPreviousSnapshot != null &&
                      !const ListEquality(ChatMessagesRecordDocumentEquality())
                          .equals(listViewChatMessagesRecordList,
                              _model.listViewPreviousSnapshot)) {
                    logFirebaseEvent(
                        'CHAT_THREAD_COMPONENT_ListView_cnpv22ga_');
                    if (!widget.chatRef!.lastMessageSeenBy
                        .contains(currentUserReference)) {
                      logFirebaseEvent('ListView_backend_call');

                      await widget.chatRef!.reference.update({
                        ...mapToFirestore(
                          {
                            'last_message_seen_by':
                                FieldValue.arrayUnion([currentUserReference]),
                          },
                        ),
                      });
                    }

                    setState(() {});
                  }
                  _model.listViewPreviousSnapshot = snapshot;
                }),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                List<ChatMessagesRecord> listViewChatMessagesRecordList =
                    snapshot.data!;
                if (listViewChatMessagesRecordList.isEmpty) {
                  return EmptyStateSimpleWidget(
                    icon: Icon(
                      Icons.forum_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 90.0,
                    ),
                    title: 'No Messages',
                    body: 'You have not sent any messages in this chat yet.',
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    12.0,
                    0,
                    24.0,
                  ),
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewChatMessagesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewChatMessagesRecord =
                        listViewChatMessagesRecordList[listViewIndex];
                    return Container(
                      decoration: const BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.chatThreadUpdateModels.getModel(
                          listViewChatMessagesRecord.reference.id,
                          listViewIndex,
                        ),
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: ChatThreadUpdateWidget(
                          key: Key(
                            'Key0bt_${listViewChatMessagesRecord.reference.id}',
                          ),
                          chatMessagesRef: listViewChatMessagesRecord,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.uploadfield == true)
                      Container(
                        width: 531.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final uploadchatphoto =
                                        _model.uploadedLocalFiles1.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: uploadchatphoto.length,
                                      itemBuilder:
                                          (context, uploadchatphotoIndex) {
                                        final uploadchatphotoItem =
                                            uploadchatphoto[
                                                uploadchatphotoIndex];
                                        return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.memory(
                                              uploadchatphotoItem.bytes ??
                                                  Uint8List.fromList([]),
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).error,
                                  borderRadius: 20.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  icon: Icon(
                                    Icons.delete_outline_rounded,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CHAT_THREAD_COMPONENT_delete_outline_rou');
                                    logFirebaseEvent(
                                        'IconButton_clear_uploaded_data');
                                    setState(() {
                                      _model.isDataUploading1 = false;
                                      _model.uploadedLocalFiles1 = [];
                                    });

                                    logFirebaseEvent(
                                        'IconButton_update_component_state');
                                    _model.uploadfield = false;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderRadius: 60.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.add_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CHAT_THREAD_COMPONENT_add_rounded_ICN_ON');
                              logFirebaseEvent(
                                  'IconButton_update_component_state');
                              _model.uploadfield = true;
                              setState(() {});
                              logFirebaseEvent(
                                  'IconButton_store_media_for_upload');
                              final selectedMedia = await selectMedia(
                                maxWidth: 504.00,
                                mediaSource: MediaSource.photoGallery,
                                multiImage: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFiles1 =
                                        selectedUploadedFiles;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }
                            },
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model
                                                  .textFieldsendTextController,
                                              focusNode:
                                                  _model.textFieldsendFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText: '發送訊息...',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                errorStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF42BAF1),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 16.0,
                                                            56.0, 16.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              maxLines: null,
                                              minLines: 1,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .textFieldsendTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 6.0, 4.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          icon: const Icon(
                                            Icons.near_me_outlined,
                                            color: Color(0xFF42BAF1),
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'CHAT_THREAD_COMPONENT_near_me_outlined_I');
                                            if (_model.uploadedLocalFiles1.isNotEmpty) {
                                              // newChatMessage
                                              logFirebaseEvent(
                                                  'IconButton_newChatMessage');

                                              var chatMessagesRecordReference1 =
                                                  ChatMessagesRecord.collection
                                                      .doc();
                                              await chatMessagesRecordReference1
                                                  .set({
                                                ...createChatMessagesRecordData(
                                                  user: currentUserReference,
                                                  chat:
                                                      widget.chatRef?.reference,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'who_can_read':
                                                        widget.chatRef?.users,
                                                  },
                                                ),
                                              });
                                              _model.newChatonlyimage =
                                                  ChatMessagesRecord
                                                      .getDocumentFromData({
                                                ...createChatMessagesRecordData(
                                                  user: currentUserReference,
                                                  chat:
                                                      widget.chatRef?.reference,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'who_can_read':
                                                        widget.chatRef?.users,
                                                  },
                                                ),
                                              }, chatMessagesRecordReference1);
                                              while (_model.uploadimagecount! <
                                                  _model.uploadedLocalFiles1
                                                      .length) {
                                                logFirebaseEvent(
                                                    'IconButton_upload_media_to_firebase');
                                                {
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];
                                                  var selectedMedia =
                                                      <SelectedFile>[];
                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles = _model
                                                            .uploadedLocalFiles1[
                                                                _model
                                                                    .uploadimagecount!]
                                                            .bytes!
                                                            .isNotEmpty
                                                        ? [
                                                            _model.uploadedLocalFiles1[
                                                                _model
                                                                    .uploadimagecount!]
                                                          ]
                                                        : <FFUploadedFile>[];
                                                    selectedMedia =
                                                        selectedFilesFromUploadedFiles(
                                                      selectedUploadedFiles,
                                                    );
                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile2 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl2 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                logFirebaseEvent(
                                                    'IconButton_backend_call');

                                                await _model
                                                    .newChatonlyimage!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'image_list': FieldValue
                                                          .arrayUnion([
                                                        _model.uploadedFileUrl2
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_update_component_state');
                                                _model.uploadimagecount =
                                                    _model.uploadimagecount! +
                                                        1;
                                                setState(() {});
                                                if (_model.uploadimagecount! >=
                                                    _model.uploadedLocalFiles1
                                                        .length) {
                                                  break;
                                                }
                                              }
                                              if (_model.textFieldsendTextController
                                                          .text !=
                                                      '') {
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');

                                                await _model
                                                    .newChatonlyimage!.reference
                                                    .update(
                                                        createChatMessagesRecordData(
                                                  text: _model
                                                      .textFieldsendTextController
                                                      .text,
                                                ));
                                                logFirebaseEvent(
                                                    'IconButton_clear_uploaded_data');
                                                setState(() {
                                                  _model.isDataUploading1 =
                                                      false;
                                                  _model.uploadedLocalFiles1 =
                                                      [];
                                                });

                                                logFirebaseEvent(
                                                    'IconButton_update_component_state');
                                                _model.uploadfield = false;
                                                setState(() {});
                                                // clearUsers
                                                logFirebaseEvent(
                                                    'IconButton_clearUsers');
                                                _model.lastSeenBy = [];
                                                // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                                //
                                                // We will then set the value of the user reference list from this page state.
                                                // addMyUserToList
                                                logFirebaseEvent(
                                                    'IconButton_addMyUserToList');
                                                _model.addToLastSeenBy(
                                                    currentUserReference!);
                                                // updateChatDocument
                                                logFirebaseEvent(
                                                    'IconButton_updateChatDocument');

                                                await widget.chatRef!.reference
                                                    .update({
                                                  ...createChatsRecordData(
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    lastMessage:
                                                        '${_model.textFieldsendTextController.text}(photo)',
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'last_message_seen_by':
                                                          _model.lastSeenBy,
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_clear_text_fields_pin_codes');
                                                setState(() {
                                                  _model
                                                      .textFieldsendTextController
                                                      ?.clear();
                                                });
                                                // clearUsers
                                                logFirebaseEvent(
                                                    'IconButton_clearUsers');
                                                _model.lastSeenBy = [];
                                                logFirebaseEvent(
                                                    'IconButton_update_component_state');
                                                _model.uploadimagecount = 0;
                                                if (widget
                                                        .chatRef!.users.length >
                                                    1) {
                                                  logFirebaseEvent(
                                                      'IconButton_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        'Connextion',
                                                    notificationText:
                                                        '你的聊天群組   ${widget.chatRef?.chatName}   有新訊息',
                                                    notificationImageUrl: widget
                                                        .chatRef
                                                        ?.groupChatPhoto,
                                                    userRefs: widget
                                                        .chatRef!.users
                                                        .where((e) =>
                                                            e !=
                                                            currentUserReference)
                                                        .toList(),
                                                    initialPageName:
                                                        'chat_2_main',
                                                    parameterData: {},
                                                  );
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'IconButton_clear_uploaded_data');
                                                setState(() {
                                                  _model.isDataUploading1 =
                                                      false;
                                                  _model.uploadedLocalFiles1 =
                                                      [];
                                                });

                                                logFirebaseEvent(
                                                    'IconButton_update_component_state');
                                                _model.uploadfield = false;
                                                setState(() {});
                                                // clearUsers
                                                logFirebaseEvent(
                                                    'IconButton_clearUsers');
                                                _model.lastSeenBy = [];
                                                // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                                //
                                                // We will then set the value of the user reference list from this page state.
                                                // addMyUserToList
                                                logFirebaseEvent(
                                                    'IconButton_addMyUserToList');
                                                _model.addToLastSeenBy(
                                                    currentUserReference!);
                                                // updateChatDocument
                                                logFirebaseEvent(
                                                    'IconButton_updateChatDocument');

                                                await widget.chatRef!.reference
                                                    .update({
                                                  ...createChatsRecordData(
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    lastMessage: 'photo',
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'last_message_seen_by':
                                                          _model.lastSeenBy,
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_clear_text_fields_pin_codes');
                                                setState(() {
                                                  _model
                                                      .textFieldsendTextController
                                                      ?.clear();
                                                });
                                                // clearUsers
                                                logFirebaseEvent(
                                                    'IconButton_clearUsers');
                                                _model.lastSeenBy = [];
                                                logFirebaseEvent(
                                                    'IconButton_update_component_state');
                                                _model.uploadimagecount = 0;
                                                if (widget
                                                        .chatRef!.users.length >
                                                    1) {
                                                  logFirebaseEvent(
                                                      'IconButton_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        'Connextion',
                                                    notificationText:
                                                        '你的聊天群組   ${widget.chatRef?.chatName}   有新訊息',
                                                    notificationImageUrl: widget
                                                        .chatRef
                                                        ?.groupChatPhoto,
                                                    notificationSound:
                                                        'default',
                                                    userRefs: widget
                                                        .chatRef!.users
                                                        .where((e) =>
                                                            e !=
                                                            currentUserReference)
                                                        .toList(),
                                                    initialPageName:
                                                        'chat_2_main',
                                                    parameterData: {},
                                                  );
                                                }
                                              }
                                            } else {
                                              if (_model.textFieldsendTextController
                                                          .text !=
                                                      '') {
                                                // newChatMessage
                                                logFirebaseEvent(
                                                    'IconButton_newChatMessage');

                                                var chatMessagesRecordReference2 =
                                                    ChatMessagesRecord
                                                        .collection
                                                        .doc();
                                                await chatMessagesRecordReference2
                                                    .set({
                                                  ...createChatMessagesRecordData(
                                                    user: currentUserReference,
                                                    chat: widget
                                                        .chatRef?.reference,
                                                    text: _model
                                                        .textFieldsendTextController
                                                        .text,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'who_can_read':
                                                          widget.chatRef?.users,
                                                    },
                                                  ),
                                                });
                                                _model.newChattext =
                                                    ChatMessagesRecord
                                                        .getDocumentFromData({
                                                  ...createChatMessagesRecordData(
                                                    user: currentUserReference,
                                                    chat: widget
                                                        .chatRef?.reference,
                                                    text: _model
                                                        .textFieldsendTextController
                                                        .text,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'who_can_read':
                                                          widget.chatRef?.users,
                                                    },
                                                  ),
                                                }, chatMessagesRecordReference2);
                                                logFirebaseEvent(
                                                    'IconButton_update_component_state');
                                                _model.uploadfield = false;
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'IconButton_clear_uploaded_data');
                                                setState(() {
                                                  _model.isDataUploading1 =
                                                      false;
                                                  _model.uploadedLocalFiles1 =
                                                      [];
                                                });

                                                // clearUsers
                                                logFirebaseEvent(
                                                    'IconButton_clearUsers');
                                                _model.lastSeenBy = [];
                                                // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                                //
                                                // We will then set the value of the user reference list from this page state.
                                                // addMyUserToList
                                                logFirebaseEvent(
                                                    'IconButton_addMyUserToList');
                                                _model.addToLastSeenBy(
                                                    currentUserReference!);
                                                // updateChatDocument
                                                logFirebaseEvent(
                                                    'IconButton_updateChatDocument');

                                                await widget.chatRef!.reference
                                                    .update({
                                                  ...createChatsRecordData(
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    lastMessage: _model
                                                        .textFieldsendTextController
                                                        .text,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'last_message_seen_by':
                                                          _model.lastSeenBy,
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_clear_text_fields_pin_codes');
                                                setState(() {
                                                  _model
                                                      .textFieldsendTextController
                                                      ?.clear();
                                                });
                                                // clearUsers
                                                logFirebaseEvent(
                                                    'IconButton_clearUsers');
                                                _model.lastSeenBy = [];
                                                if (widget
                                                        .chatRef!.users.length >
                                                    1) {
                                                  logFirebaseEvent(
                                                      'IconButton_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        'connextion',
                                                    notificationText:
                                                        '你的聊天群組   ${widget.chatRef?.chatName}   有新訊息',
                                                    notificationImageUrl: widget
                                                        .chatRef
                                                        ?.groupChatPhoto,
                                                    userRefs: widget
                                                        .chatRef!.users
                                                        .where((e) =>
                                                            e !=
                                                            currentUserReference)
                                                        .toList(),
                                                    initialPageName:
                                                        'chat_2_main',
                                                    parameterData: {},
                                                  );
                                                }
                                              }
                                            }

                                            setState(() {});
                                          },
                                        ),
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
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 2.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
