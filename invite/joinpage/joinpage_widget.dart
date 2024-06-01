import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'joinpage_model.dart';
export 'joinpage_model.dart';

class JoinpageWidget extends StatefulWidget {
  const JoinpageWidget({
    super.key,
    required this.postchosed,
  });

  final DocumentReference? postchosed;

  @override
  State<JoinpageWidget> createState() => _JoinpageWidgetState();
}

class _JoinpageWidgetState extends State<JoinpageWidget> {
  late JoinpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JoinpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'joinpage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InvAskListRecord>>(
      stream: FFAppState().invMemberSaftyMode(
        uniqueQueryKey: widget.postchosed?.id,
        requestFn: () => queryInvAskListRecord(
          parent: widget.postchosed,
          singleRecord: true,
        ),
      ),
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
        List<InvAskListRecord> joinpageInvAskListRecordList = snapshot.data!;
        final joinpageInvAskListRecord = joinpageInvAskListRecordList.isNotEmpty
            ? joinpageInvAskListRecordList.first
            : null;
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
                stream: PostRecord.getDocument(widget.postchosed!),
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'JOINPAGE_PAGE_取消_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_back');
                                    context.safePop();
                                  },
                                  text: '取消',
                                  options: FFButtonOptions(
                                    width: 70.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).info,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'YuPearl',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Color(0x2D57636C),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'JOINPAGE_PAGE_申請加入_BTN_ON_TAP');
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      _model.addToCan(currentUserReference!);
                                      setState(() {});
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      _model
                                          .addToCan(stackPostRecord.postUser!);
                                      setState(() {});
                                      logFirebaseEvent('Button_backend_call');

                                      var inviteAskListRecordReference =
                                          InviteAskListRecord.collection.doc();
                                      await inviteAskListRecordReference.set({
                                        ...createInviteAskListRecordData(
                                          sender: currentUserReference,
                                          resceiver: stackPostRecord.postUser,
                                          senderIntro:
                                              _model.textController.text,
                                          sendTime: getCurrentTimestamp,
                                          invPost: stackPostRecord.reference,
                                          haveSeen: false,
                                          inviteStatus: 2,
                                          invCourse2:
                                              stackPostRecord.postCourseInfo2,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'user_can_write': _model.can,
                                          },
                                        ),
                                      });
                                      _model.joingroupphoto =
                                          InviteAskListRecord
                                              .getDocumentFromData({
                                        ...createInviteAskListRecordData(
                                          sender: currentUserReference,
                                          resceiver: stackPostRecord.postUser,
                                          senderIntro:
                                              _model.textController.text,
                                          sendTime: getCurrentTimestamp,
                                          invPost: stackPostRecord.reference,
                                          haveSeen: false,
                                          inviteStatus: 2,
                                          invCourse2:
                                              stackPostRecord.postCourseInfo2,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'user_can_write': _model.can,
                                          },
                                        ),
                                      }, inviteAskListRecordReference);
                                      if (_model.isDataUploading2) {
                                        logFirebaseEvent(
                                            'Button_upload_media_to_firebase');
                                        {
                                          setState(() =>
                                              _model.isDataUploading1 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                          var selectedMedia = <SelectedFile>[];
                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles = _model
                                                    .uploadedLocalFile2
                                                    .bytes!
                                                    .isNotEmpty
                                                ? [_model.uploadedLocalFile2]
                                                : <FFUploadedFile>[];
                                            selectedMedia =
                                                selectedFilesFromUploadedFiles(
                                              selectedUploadedFiles,
                                            );
                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading1 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile1 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl1 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        logFirebaseEvent('Button_backend_call');

                                        await _model.joingroupphoto!.reference
                                            .update(
                                                createInviteAskListRecordData(
                                          inviteIntroPhoto:
                                              _model.uploadedFileUrl1,
                                        ));
                                        logFirebaseEvent('Button_backend_call');

                                        await joinpageInvAskListRecord!
                                            .reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'inv_ask_member':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed('main');

                                        logFirebaseEvent(
                                            'Button_trigger_push_notification');
                                        triggerPushNotification(
                                          notificationTitle: 'Connextion ',
                                          notificationText: '您的貼文有一則申請',
                                          notificationImageUrl:
                                              currentUserPhoto,
                                          notificationSound: 'default',
                                          userRefs: [stackPostRecord.postUser!],
                                          initialPageName: 'detailinvitepage',
                                          parameterData: {
                                            'invitebyotherdetail': _model
                                                .joingroupphoto?.reference,
                                          },
                                        );
                                      } else {
                                        if (joinpageInvAskListRecord != null) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await joinpageInvAskListRecord
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'inv_ask_member':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('main');

                                          logFirebaseEvent(
                                              'Button_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle: 'Connextion ',
                                            notificationText: '您的貼文有一則申請',
                                            notificationImageUrl:
                                                currentUserPhoto,
                                            notificationSound: 'default',
                                            userRefs: [
                                              stackPostRecord.postUser!
                                            ],
                                            initialPageName: 'detailinvitepage',
                                            parameterData: {
                                              'invitebyotherdetail': _model
                                                  .joingroupphoto?.reference,
                                            },
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await InvAskListRecord.createDoc(
                                                  widget.postchosed!)
                                              .set({
                                            ...mapToFirestore(
                                              {
                                                'inv_ask_member': [
                                                  currentUserReference
                                                ],
                                              },
                                            ),
                                          });
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('main');

                                          logFirebaseEvent(
                                              'Button_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle: 'Connextion ',
                                            notificationText: '您的貼文有一則申請',
                                            notificationImageUrl:
                                                currentUserPhoto,
                                            notificationSound: 'default',
                                            userRefs: [
                                              stackPostRecord.postUser!
                                            ],
                                            initialPageName: 'detailinvitepage',
                                            parameterData: {
                                              'invitebyotherdetail': _model
                                                  .joingroupphoto?.reference,
                                            },
                                          );
                                        }
                                      }

                                      setState(() {});
                                    },
                                    text: '申請加入',
                                    options: FFButtonOptions(
                                      width: 80.0,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF42BAF1),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'YuPearl',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Color(0xFF42BAF1),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 200.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 20.0, 10.0, 12.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            const Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '為甚麼想加入這個聊天室...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'YuPearl',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 12.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'YuPearl',
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: 7,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ((_model.uploadedLocalFile2.bytes
                                                    ?.isNotEmpty ??
                                                false))
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.memory(
                                                _model.uploadedLocalFile2
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                width: 200.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        if ((_model.uploadedLocalFile2.bytes
                                                    ?.isNotEmpty ??
                                                false))
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
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
                                                Icons.close_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'JOINPAGE_PAGE_close_sharp_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_clear_uploaded_data');
                                                setState(() {
                                                  _model.isDataUploading2 =
                                                      false;
                                                  _model.uploadedLocalFile2 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                });
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.add_photo_alternate_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'JOINadd_photo_alternate_outlined_ICN_ON_');
                                            logFirebaseEvent(
                                                'IconButton_store_media_for_upload');
                                            final selectedMedia =
                                                await selectMedia(
                                              maxWidth: 504.00,
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading2 = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading2 = false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile2 =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }
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
