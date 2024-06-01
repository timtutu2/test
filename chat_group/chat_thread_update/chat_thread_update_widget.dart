import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'chat_thread_update_model.dart';
export 'chat_thread_update_model.dart';

class ChatThreadUpdateWidget extends StatefulWidget {
  const ChatThreadUpdateWidget({
    super.key,
    required this.chatMessagesRef,
  });

  final ChatMessagesRecord? chatMessagesRef;

  @override
  State<ChatThreadUpdateWidget> createState() => _ChatThreadUpdateWidgetState();
}

class _ChatThreadUpdateWidgetState extends State<ChatThreadUpdateWidget> {
  late ChatThreadUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatThreadUpdateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.chatMessagesRef?.user != currentUserReference)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                child: FutureBuilder<UsersRecord>(
                  future: _model.chatUser(
                    uniqueQueryKey: widget.chatMessagesRef?.reference.id,
                    requestFn: () => UsersRecord.getDocumentOnce(
                        widget.chatMessagesRef!.user!),
                  ),
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
                    final otherUserUsersRecord = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 8.0, 16.0),
                          child: Container(
                            width: 36.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).accent1,
                                width: 2.0,
                              ),
                            ),
                            child: Builder(
                              builder: (context) {
                                if (otherUserUsersRecord.photoUrl != '') {
                                  return Stack(
                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CHAT_THREAD_UPDATE_Image_dfpum1b0_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_navigate_to');

                                            context.pushNamed(
                                              'link_userprofile',
                                              queryParameters: {
                                                'profileUserRef':
                                                    serializeParam(
                                                  otherUserUsersRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 200),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 200),
                                              imageUrl: valueOrDefault<String>(
                                                otherUserUsersRecord.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-at3mts/assets/jozbfglfd548/flutterflow_future%402x.jpg',
                                              ),
                                              width: 44.0,
                                              height: 44.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (functions.verifyemail(
                                              otherUserUsersRecord.email) ==
                                          true)
                                        const Icon(
                                          Icons.check_circle_rounded,
                                          color: Color(0xFF42BAF1),
                                          size: 12.0,
                                        ),
                                    ],
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.person_2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          if (functions.verifyemail(
                                                  otherUserUsersRecord.email) ==
                                              true)
                                            const Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF42BAF1),
                                                size: 10.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 50.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AutoSizeText(
                                        otherUserUsersRecord.displayName,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'YuPearl',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                                Stack(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(22.0),
                                            bottomRight: Radius.circular(22.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(22.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (widget.chatMessagesRef
                                                          ?.hasText() ??
                                                      false) {
                                                    return SelectionArea(
                                                        child: Text(
                                                      valueOrDefault<String>(
                                                        widget.chatMessagesRef
                                                            ?.text,
                                                        '--',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                'YuPearl',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ));
                                                  } else {
                                                    return Container(
                                                      width: 0.0,
                                                      height: 1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              if (widget.chatMessagesRef
                                                          ?.imageList !=
                                                      null &&
                                                  (widget.chatMessagesRef
                                                          ?.imageList)!
                                                      .isNotEmpty)
                                                Container(
                                                  width: 160.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Flexible(
                                                        child: Builder(
                                                          builder: (context) {
                                                            final chatothermedia = widget
                                                                    .chatMessagesRef
                                                                    ?.imageList
                                                                    .toList() ??
                                                                [];
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  chatothermedia
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  chatothermediaIndex) {
                                                                final chatothermediaItem =
                                                                    chatothermedia[
                                                                        chatothermediaIndex];
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Visibility(
                                                                      visible: widget.chatMessagesRef?.imageList !=
                                                                              null &&
                                                                          (widget.chatMessagesRef?.imageList)!
                                                                              .isNotEmpty,
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'CHAT_THREAD_UPDATE_MediaDisplay_u77zgbha');
                                                                          logFirebaseEvent(
                                                                              'MediaDisplay_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'image_Details',
                                                                            queryParameters:
                                                                                {
                                                                              'chatMessage': serializeParam(
                                                                                widget.chatMessagesRef,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'clickphotodetail': serializeParam(
                                                                                chatothermediaItem,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'chatMessage': widget.chatMessagesRef,
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            FlutterFlowMediaDisplay(
                                                                          path:
                                                                              chatothermediaItem,
                                                                          imageBuilder: (path) =>
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                            child:
                                                                                Image.network(
                                                                              path,
                                                                              width: 130.0,
                                                                              height: 150.0,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                          videoPlayerBuilder: (path) =>
                                                                              FlutterFlowVideoPlayer(
                                                                            path:
                                                                                path,
                                                                            autoPlay:
                                                                                false,
                                                                            looping:
                                                                                false,
                                                                            showControls:
                                                                                false,
                                                                            allowFullScreen:
                                                                                false,
                                                                            allowPlaybackSpeedMenu:
                                                                                false,
                                                                            pauseOnNavigate:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
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
                                      ),
                                    ),
                                    if (widget
                                            .chatMessagesRef!.imageList.length >
                                        1)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 4.0, 0.0, 8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        'relative',
                                        widget.chatMessagesRef?.timestamp,
                                        locale: FFLocalizations.of(context)
                                                .languageShortCode ??
                                            FFLocalizations.of(context)
                                                .languageCode,
                                      ),
                                      '--',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'YuPearl',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        if (widget.chatMessagesRef?.user == currentUserReference)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(50.0, 12.0, 12.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).info,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(22.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(22.0),
                                topRight: Radius.circular(22.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).accent1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (widget.chatMessagesRef?.hasText() ??
                                          false) {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            valueOrDefault<String>(
                                              widget.chatMessagesRef?.text,
                                              '--',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'YuPearl',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          )),
                                        );
                                      } else {
                                        return Container(
                                          width: 1.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  if (widget.chatMessagesRef?.imageList !=
                                          null &&
                                      (widget.chatMessagesRef?.imageList)!
                                          .isNotEmpty)
                                    Container(
                                      width: 160.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Builder(
                                              builder: (context) {
                                                final chatmymedia = widget
                                                        .chatMessagesRef
                                                        ?.imageList
                                                        .toList() ??
                                                    [];
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: chatmymedia.length,
                                                  itemBuilder: (context,
                                                      chatmymediaIndex) {
                                                    final chatmymediaItem =
                                                        chatmymedia[
                                                            chatmymediaIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Visibility(
                                                          visible: widget
                                                                      .chatMessagesRef
                                                                      ?.imageList !=
                                                                  null &&
                                                              (widget.chatMessagesRef
                                                                      ?.imageList)!
                                                                  .isNotEmpty,
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
                                                                  'CHAT_THREAD_UPDATE_MediaDisplay_1kq1ohm9');
                                                              logFirebaseEvent(
                                                                  'MediaDisplay_navigate_to');

                                                              context.pushNamed(
                                                                'image_Details',
                                                                queryParameters:
                                                                    {
                                                                  'chatMessage':
                                                                      serializeParam(
                                                                    widget
                                                                        .chatMessagesRef,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'clickphotodetail':
                                                                      serializeParam(
                                                                    chatmymediaItem,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'chatMessage':
                                                                      widget
                                                                          .chatMessagesRef,
                                                                },
                                                              );
                                                            },
                                                            child:
                                                                FlutterFlowMediaDisplay(
                                                              path:
                                                                  chatmymediaItem,
                                                              imageBuilder:
                                                                  (path) =>
                                                                      ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                                child: Image
                                                                    .network(
                                                                  path,
                                                                  width: 130.0,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                ),
                                                              ),
                                                              videoPlayerBuilder:
                                                                  (path) =>
                                                                      FlutterFlowVideoPlayer(
                                                                path: path,
                                                                width: 300.0,
                                                                autoPlay: false,
                                                                looping: true,
                                                                showControls:
                                                                    true,
                                                                allowFullScreen:
                                                                    true,
                                                                allowPlaybackSpeedMenu:
                                                                    false,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
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
                          ),
                        ),
                        if (widget.chatMessagesRef!.imageList.length > 1)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 10.0, 0.0),
                            child: Icon(
                              Icons.chevron_right,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 5.0, 8.0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat(
                            'relative',
                            widget.chatMessagesRef?.timestamp,
                            locale:
                                FFLocalizations.of(context).languageShortCode ??
                                    FFLocalizations.of(context).languageCode,
                          ),
                          '--',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'YuPearl',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
