import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'eula_model.dart';
export 'eula_model.dart';

class EulaWidget extends StatefulWidget {
  const EulaWidget({super.key});

  @override
  State<EulaWidget> createState() => _EulaWidgetState();
}

class _EulaWidgetState extends State<EulaWidget> {
  late EulaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EulaModel());
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
      height: 403.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '隱私保護提示',
              textAlign: TextAlign.justify,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'YuPearl',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              '\n我們非常重視您的隱私保護和個人信息保護，感謝您對我們的信任。使用Connextion前請仔細閱讀《用戶規範》及《隱私權政策》全部內容，我們將在聲明所述範圍內收集和使用您的個人資訊。如果您同意，請點擊「同意」開始接受我我們的服務。\n',
              textAlign: TextAlign.justify,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'YuPearl',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 43.0, 0.0),
                  child: Text(
                    '用戶規範',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'YuPearl',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('EULA_COMP_前往閱讀_BTN_ON_TAP');
                    logFirebaseEvent('Button_launch_u_r_l');
                    unawaited(
                      () async {
                        await launchURL('https://connextion.com.tw/EULA');
                      }(),
                    );
                  },
                  text: '前往閱讀',
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'YuPearl',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                    child: Text(
                      '隱私權政策',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'YuPearl',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('EULA_COMP_前往閱讀_BTN_ON_TAP');
                      logFirebaseEvent('Button_launch_u_r_l');
                      unawaited(
                        () async {
                          await launchURL(
                              'https://connextion.com.tw/privacy_policy');
                        }(),
                      );
                    },
                    text: '前往閱讀',
                    icon: const Icon(
                      Icons.arrow_right_alt,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'YuPearl',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('EULA_COMP_拒絕_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        eULAAgreement: false,
                      ));
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearInviteListCacheCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearChatMessageTestCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearPostUserInfoCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearUserDocQueryCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearInvMemberSaftyModeCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearUCollectionPostCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearPostFilterCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearCommentOfTheCourseCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearUserInfoCommentCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearPostAllCacheCache();
                      logFirebaseEvent('Button_clear_query_cache');
                      FFAppState().clearBlockUserCache();
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().chooseCourseRef = [];
                      FFAppState().showcourseDetail = true;
                      FFAppState().coursecurriculumRef = FirebaseFirestore
                          .instance
                          .doc('/course_curriculum/default');
                      FFAppState().isOverride = true;
                      FFAppState().lasttimeOverride = getCurrentTimestamp;
                      FFAppState().EULAgreementApp = false;
                      logFirebaseEvent('Button_navigate_to');

                      context.goNamedAuth('auth_2_Login', context.mounted);
                    },
                    text: '拒絕',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF42BAF1),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'YuPearl',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('EULA_COMP_同意_BTN_ON_TAP');
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().EULAgreementApp = true;
                      setState(() {});
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        eULAAgreement: true,
                      ));
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
                    text: '同意',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF42BAF1),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'YuPearl',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
