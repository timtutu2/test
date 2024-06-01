import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'delete_account_model.dart';
export 'delete_account_model.dart';

class DeleteAccountWidget extends StatefulWidget {
  const DeleteAccountWidget({super.key});

  @override
  State<DeleteAccountWidget> createState() => _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState extends State<DeleteAccountWidget>
    with TickerProviderStateMixin {
  late DeleteAccountModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountModel());

    animationsMap.addAll({
      'mouseRegionOnPageLoadAnimation': AnimationInfo(
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).info,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 8.0),
                      child: Text(
                        '選項',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'YuPearl',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                      ),
                    ),
                    Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            MouseRegion(
                              opaque: false,
                              cursor:
                                  SystemMouseCursors.click ?? MouseCursor.defer,
                              onEnter: ((event) async {
                                setState(
                                    () => _model.mouseRegionHovered = true);
                              }),
                              onExit: ((event) async {
                                setState(
                                    () => _model.mouseRegionHovered = false);
                              }),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: _model.mouseRegionHovered
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 12.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                'Confirm Delete',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '確定要刪除嗎？\n所有與此帳號相關的資料都將會被刪除',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'DELETE_ACCOUNT_delete_outline_ICN_ON_TAP');
                                          await Future.wait([
                                            Future(() async {
                                              logFirebaseEvent(
                                                  'IconButton_auth');
                                              await authManager
                                                  .deleteUser(context);
                                            }),
                                            Future(() async {
                                              logFirebaseEvent(
                                                  'IconButton_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '正在移除資料',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 10000),
                                                  backgroundColor:
                                                      const Color(0xFF42BAF1),
                                                ),
                                              );
                                            }),
                                          ]);
                                          logFirebaseEvent('IconButton_auth');
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await authManager.signOut();
                                          GoRouter.of(context)
                                              .clearRedirectLocation();

                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState()
                                              .clearInviteListCacheCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState()
                                              .clearChatMessageTestCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState().clearUserDocQueryCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState()
                                              .clearInvMemberSaftyModeCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState()
                                              .clearUCollectionPostCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState().clearPostFilterCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState().clearPostUserInfoCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState()
                                              .clearCommentOfTheCourseCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState()
                                              .clearUserInfoCommentCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState().clearPostAllCacheCache();
                                          logFirebaseEvent(
                                              'IconButton_clear_query_cache');
                                          FFAppState().clearBlockUserCache();
                                          logFirebaseEvent(
                                              'IconButton_update_app_state');
                                          FFAppState().chooseCourseRef = [];
                                          FFAppState().showcourseDetail = true;
                                          FFAppState().coursecurriculumRef =
                                              FirebaseFirestore.instance.doc(
                                                  '/course_curriculum/default');
                                          FFAppState().isOverride = true;
                                          FFAppState().lasttimeOverride =
                                              getCurrentTimestamp;
                                          FFAppState().EULAgreementApp = false;
                                          logFirebaseEvent(
                                              'IconButton_navigate_to');

                                          context.goNamedAuth(
                                              'StartPage', context.mounted);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'mouseRegionOnPageLoadAnimation']!),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
