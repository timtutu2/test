import '/app_version_check/appcheck/appcheck_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/privacy_and_e_u_l_a/eula/eula_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'postpage_model.dart';
export 'postpage_model.dart';

class PostpageWidget extends StatefulWidget {
  const PostpageWidget({super.key});

  @override
  State<PostpageWidget> createState() => _PostpageWidgetState();
}

class _PostpageWidgetState extends State<PostpageWidget>
    with TickerProviderStateMixin {
  late PostpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'postpage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POSTPAGE_PAGE_postpage_ON_INIT_STATE');
      if (!FFAppState().EULAgreementApp) {
        logFirebaseEvent('postpage_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const SizedBox(
                  height: 410.0,
                  child: EulaWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        logFirebaseEvent('postpage_google_analytics_event');
        logFirebaseEvent(
          'navBar_click',
          parameters: {
            'nav_bar': 'Post',
          },
        );
      }
      logFirebaseEvent('postpage_custom_action');
      _model.versionGet = await actions.versioncheck();
      logFirebaseEvent('postpage_firestore_query');
      _model.versionLastest = await queryVersionCheckRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('postpage_update_app_state');
      FFAppState().ApplastestVersion = FFAppState().ApplastestVersion;
      if (_model.versionGet != FFAppState().ApplastestVersion) {
        logFirebaseEvent('postpage_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const SizedBox(
                  height: 410.0,
                  child: AppcheckWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      logFirebaseEvent('postpage_custom_action');
      unawaited(
        () async {
          await actions.fixpageNorotate();
        }(),
      );
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldpeopleTextController ??= TextEditingController();
    _model.textFieldpeopleFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.chatpostTextController ??= TextEditingController();
    _model.chatpostFocusNode ??= FocusNode();

    _model.textFieldsearchTextController ??= TextEditingController();

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(94.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if ((_model.showchoosepage == false) &&
                  (_model.showpeoplenum == false) &&
                  (_model.showmoney == false) &&
                  (_model.showCategory == false))
                Opacity(
                  opacity: _model.showpeoplenum || _model.showmoney ? 0.2 : 1.0,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25.0, 15.0, 25.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'POSTPAGE_PAGE_取消_BTN_ON_TAP');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('main');
                                },
                                text: '取消',
                                options: FFButtonOptions(
                                  width: 60.0,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0x6E57636C),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'YuPearl',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).info,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'POSTPAGE_PAGE_下一步_BTN_ON_TAP');
                                  logFirebaseEvent('Button_validate_form');
                                  if (_model.formKey2.currentState == null ||
                                      !_model.formKey2.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.showCategory = true;
                                  _model.showCourseConfirm = false;
                                  setState(() {});
                                },
                                text: '下一步',
                                options: FFButtonOptions(
                                  width: 60.0,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFF42BAF1),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'YuPearl',
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Container(
                                  height: 200.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Form(
                                      key: _model.formKey2,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController1',
                                            const Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '撰寫貼文...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'YuPearl',
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
                                          maxLines: 30,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 4.0),
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
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if ((_model.uploadedLocalFile1.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(40.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'POSTPAGE_PAGE_Image_pznipo3x_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Image_expand_image');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.uploadedLocalFile1
                                                                        .bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag1',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag1',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.uploadedLocalFile1
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 250.0,
                                                            height: 180.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      icon: Icon(
                                                        Icons.close_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'POSTPAGE_PAGE_close_sharp_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_clear_uploaded_data');
                                                        setState(() {
                                                          _model.isDataUploading1 =
                                                              false;
                                                          _model.uploadedLocalFile1 =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container(
                                            width: 1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              if (_model.tempPeopleNum != null)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 0.0),
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
                                          Icons.delete_forever,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'POSTPAGE_PAGE_delete_forever_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          _model.tempPeopleNum = null;
                                          setState(() {});
                                        },
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.people_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '人限',
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
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              _model.tempPeopleNum!.toString(),
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
                                    ],
                                  ),
                                ),
                              if (_model.tempmoney != null &&
                                  _model.tempmoney != '')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 8.0, 15.0, 0.0),
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
                                          Icons.delete_forever,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'POSTPAGE_PAGE_delete_forever_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          _model.tempmoney = null;
                                          setState(() {});
                                        },
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.attach_money_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '賞金',
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
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              _model.tempmoney!,
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
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
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
                                              'POSTadd_photo_alternate_outlined_ICN_ON_');
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
                                            setState(() =>
                                                _model.isDataUploading1 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
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
                                              _model.isDataUploading1 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              setState(() {
                                                _model.uploadedLocalFile1 =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: const Color(0x004B39EF),
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: const Color(0x004B39EF),
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'POSTPAGE_PAGE_calendar_month_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          _model.showchoosepage = true;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: const Color(0x004B39EF),
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: const Color(0x004B39EF),
                                        icon: Icon(
                                          Icons.attach_money_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'POSTattach_money_rounded_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          _model.showmoney = true;
                                          _model.showCourseConfirm = false;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: const Color(0x004B39EF),
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: const Color(0x004B39EF),
                                      icon: Icon(
                                        Icons.person,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'POSTPAGE_PAGE_person_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_update_page_state');
                                        _model.showpeoplenum = true;
                                        _model.showCourseConfirm = false;
                                        setState(() {});
                                      },
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
              if (_model.showpeoplenum == true)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('POSTPAGE_PAGE_Columnpeople_ON_TAP');
                    logFirebaseEvent('Columnpeople_update_page_state');
                    _model.showpeoplenum = false;
                    _model.showCourseConfirm = true;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Container(
                                height: 230.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).info,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 6.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        0.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '允許加入人數',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              icon: Icon(
                                                Icons.cancel_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'POSTPAGE_PAGE_cancel_outlined_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_update_page_state');
                                                _model.showpeoplenum = false;
                                                _model.showCourseConfirm = true;
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Form(
                                        key: _model.formKey3,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .textFieldpeopleTextController,
                                            focusNode:
                                                _model.textFieldpeopleFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textFieldpeopleTextController',
                                              const Duration(milliseconds: 100),
                                              () => setState(() {}),
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: '人數',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'YuPearl',
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .textFieldpeopleTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed:
                                              (_model.textFieldpeopleTextController
                                                              .text ==
                                                          '')
                                                  ? null
                                                  : () async {
                                                      logFirebaseEvent(
                                                          'POSTPAGE_PAGE_確認_BTN_ON_TAP');
                                                      if (_model
                                                              .textFieldpeopleTextController
                                                              .text ==
                                                          '0') {
                                                        logFirebaseEvent(
                                                            'Button_clear_text_fields_pin_codes');
                                                        setState(() {
                                                          _model
                                                              .textFieldpeopleTextController
                                                              ?.clear();
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_validate_form');
                                                        if (_model.formKey3
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey3
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        logFirebaseEvent(
                                                            'Button_wait__delay');
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500));
                                                        logFirebaseEvent(
                                                            'Button_reset_form_fields');
                                                        setState(() {
                                                          _model
                                                              .textFieldpeopleTextController
                                                              ?.clear();
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.tempPeopleNum =
                                                            int.tryParse(_model
                                                                .textFieldpeopleTextController
                                                                .text);
                                                        _model.showpeoplenum =
                                                            false;
                                                        _model.showCourseConfirm =
                                                            true;
                                                        setState(() {});
                                                      }
                                                    },
                                          text: '確認',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 60.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF42BAF1),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            disabledColor: const Color(0xFFDBDCDE),
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
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation1']!),
              if (_model.showmoney == true)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('POSTPAGE_PAGE_Columnmoney_ON_TAP');
                    logFirebaseEvent('Columnmoney_update_page_state');
                    _model.showmoney = false;
                    _model.showCourseConfirm = true;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Container(
                                height: 230.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).info,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 6.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        0.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '給予他人之獎勵',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              icon: Icon(
                                                Icons.cancel_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'POSTPAGE_PAGE_cancel_outlined_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_update_page_state');
                                                _model.showmoney = false;
                                                _model.showCourseConfirm = true;
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode2,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController3',
                                            const Duration(milliseconds: 100),
                                            () => setState(() {}),
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: '金額',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'YuPearl',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'YuPearl',
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: false,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'YuPearl',
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: (_model.textController3.text ==
                                                      '')
                                              ? null
                                              : () async {
                                                  logFirebaseEvent(
                                                      'POSTPAGE_PAGE_確認_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_update_page_state');
                                                  _model.tempmoney = _model
                                                      .textController3.text;
                                                  _model.showmoney = false;
                                                  _model.showCourseConfirm =
                                                      true;
                                                  setState(() {});
                                                },
                                          text: '確認',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 60.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF42BAF1),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            disabledColor: const Color(0xFFDBDCDE),
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
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation2']!),
              if (_model.showCategory == true)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/background.svg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    icon: Icon(
                                      Icons.chevron_left_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POSTchevron_left_sharp_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_update_page_state');
                                      _model.showCategory = false;
                                      _model.showCourseConfirm = true;
                                      setState(() {});
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 16.0, 8.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'POSTPAGE_PAGE_發文_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_validate_form');
                                        if (_model.formKey1.currentState ==
                                                null ||
                                            !_model.formKey1.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if ((_model.uploadedLocalFile1.bytes
                                                    ?.isNotEmpty ??
                                                false)) {
                                          logFirebaseEvent(
                                              'Button_upload_media_to_firebase');
                                          {
                                            setState(() =>
                                                _model.isDataUploading2 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadedLocalFile1
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.uploadedLocalFile1]
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
                                              _model.isDataUploading2 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              setState(() {
                                                _model.uploadedLocalFile2 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl2 =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }

                                          logFirebaseEvent(
                                              'Button_firestore_query');
                                          _model.outputpostPhoto =
                                              await queryPostRecordOnce();
                                          if (_model.outputpostPhoto != null &&
                                              (_model.outputpostPhoto)!
                                                  .isNotEmpty) {
                                            logFirebaseEvent(
                                                'Button_custom_action');
                                            _model.outInt =
                                                await actions.noRepeatInt(
                                              _model.outputpostPhoto!
                                                  .map((e) => e.reference)
                                                  .toList(),
                                            );
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            var postRecordReference1 =
                                                PostRecord.collection.doc();
                                            await postRecordReference1.set({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID:
                                                    random_data.randomInteger(
                                                        100000, 999999),
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postPhoto:
                                                    _model.uploadedFileUrl2,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            });
                                            _model.newCreatePost =
                                                PostRecord.getDocumentFromData({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID:
                                                    random_data.randomInteger(
                                                        100000, 999999),
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postPhoto:
                                                    _model.uploadedFileUrl2,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            }, postRecordReference1);
                                            if (_model.newCreatePost
                                                    ?.postCourseInfo2 !=
                                                null) {
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              _model.docfromcoursechosed =
                                                  await actions
                                                      .getDocfromrefNthucourse(
                                                _model.coursechosed!,
                                              );
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await _model
                                                  .newCreatePost!.reference
                                                  .update(createPostRecordData(
                                                postCourseNameForSearch: _model
                                                    .docfromcoursechosed
                                                    ?.chineseName,
                                                postCourseProNameForsearch:
                                                    _model.docfromcoursechosed
                                                        ?.teacher,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            var postRecordReference2 =
                                                PostRecord.collection.doc();
                                            await postRecordReference2.set({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID:
                                                    random_data.randomInteger(
                                                        10000, 10000000),
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postPhoto:
                                                    _model.uploadedFileUrl2,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            });
                                            _model.newCreatePostEmpty =
                                                PostRecord.getDocumentFromData({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID:
                                                    random_data.randomInteger(
                                                        10000, 10000000),
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postPhoto:
                                                    _model.uploadedFileUrl2,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            }, postRecordReference2);
                                            if (_model.newCreatePost
                                                    ?.postCourseInfo2 !=
                                                null) {
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              _model.docfromcoursechosedEmpty =
                                                  await actions
                                                      .getDocfromrefNthucourse(
                                                _model.coursechosed!,
                                              );
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await _model
                                                  .newCreatePostEmpty!.reference
                                                  .update(createPostRecordData(
                                                postCourseNameForSearch: _model
                                                    .docfromcoursechosedEmpty
                                                    ?.chineseName,
                                                postCourseProNameForsearch:
                                                    _model
                                                        .docfromcoursechosedEmpty
                                                        ?.teacher,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            }
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_firestore_query');
                                          _model.outputpostno =
                                              await queryPostRecordOnce();
                                          if (_model.outputpostno != null &&
                                              (_model.outputpostno)!
                                                  .isNotEmpty) {
                                            logFirebaseEvent(
                                                'Button_custom_action');
                                            _model.outint =
                                                await actions.noRepeatInt(
                                              _model.outputpostno!
                                                  .map((e) => e.reference)
                                                  .toList(),
                                            );
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            var postRecordReference3 =
                                                PostRecord.collection.doc();
                                            await postRecordReference3.set({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID: _model.outint,
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            });
                                            _model.newCreatePostNophoto =
                                                PostRecord.getDocumentFromData({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID: _model.outint,
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            }, postRecordReference3);
                                            if (_model.coursechosed != null) {
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              _model.docfromcoursechosedNophoto =
                                                  await actions
                                                      .getDocfromrefNthucourse(
                                                _model.coursechosed!,
                                              );
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await _model.newCreatePostNophoto!
                                                  .reference
                                                  .update(createPostRecordData(
                                                postCourseNameForSearch: _model
                                                    .docfromcoursechosedNophoto
                                                    ?.chineseName,
                                                postCourseProNameForsearch: _model
                                                    .docfromcoursechosedNophoto
                                                    ?.teacher,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                                _model
                                                    .textFieldsearchTextController
                                                    ?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            var postRecordReference4 =
                                                PostRecord.collection.doc();
                                            await postRecordReference4.set({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID:
                                                    random_data.randomInteger(
                                                        10000, 10000000),
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            });
                                            _model.newCreatePostNophotoNew =
                                                PostRecord.getDocumentFromData({
                                              ...createPostRecordData(
                                                postUser: currentUserReference,
                                                postText:
                                                    _model.textController1.text,
                                                postTime: getCurrentTimestamp,
                                                chatOfPostID:
                                                    random_data.randomInteger(
                                                        10000, 10000000),
                                                postStatus: true,
                                                limitPeopleNum:
                                                    _model.tempPeopleNum,
                                                postInfoMoney: _model.tempmoney,
                                                postCategory:
                                                    _model.radioButtonValue,
                                                postCourseInfo2:
                                                    _model.coursechosed,
                                                postChatName: _model
                                                    .chatpostTextController
                                                    .text,
                                                needApply:
                                                    _model.needSupplyValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'join_member': [
                                                    currentUserReference
                                                  ],
                                                },
                                              ),
                                            }, postRecordReference4);
                                            if (_model.coursechosed != null) {
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              _model.docfromcoursechosedNophotoNew =
                                                  await actions
                                                      .getDocfromrefNthucourse(
                                                _model.coursechosed!,
                                              );
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await _model
                                                  .newCreatePostNophotoNew!
                                                  .reference
                                                  .update(createPostRecordData(
                                                postCourseNameForSearch: _model
                                                    .docfromcoursechosedNophotoNew
                                                    ?.chineseName,
                                                postCourseProNameForsearch: _model
                                                    .docfromcoursechosedNophotoNew
                                                    ?.teacher,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController1?.clear();
                                                _model
                                                    .textFieldsearchTextController
                                                    ?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading1 = false;
                                                _model.uploadedLocalFile1 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed('main');
                                            }
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: '發文',
                                      options: FFButtonOptions(
                                        width: 70.0,
                                        height: 32.0,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
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
                                  0.0, 85.0, 0.0, 0.0),
                              child: Text(
                                '貼文的聊天室名稱？',
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      fontFamily: 'YuPearl',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Form(
                              key: _model.formKey1,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  decoration: const BoxDecoration(),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    child: TextFormField(
                                      controller: _model.chatpostTextController,
                                      focusNode: _model.chatpostFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Work Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: '貼文聊天室名稱(未來可變更)',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'YuPearl',
                                              fontSize: 12.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x9B14181B),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'YuPearl',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .chatpostTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Text(
                                '你的貼文是哪種類型 ？',
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      fontFamily: 'YuPearl',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowRadioButton(
                                    options: ['解題', '找隊友/小組討論', '其他(買賣、時事...)']
                                        .toList(),
                                    onChanged: (val) => setState(() {}),
                                    controller:
                                        _model.radioButtonValueController ??=
                                            FormFieldController<String>('解題'),
                                    optionHeight: 32.0,
                                    optionWidth: 170.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    selectedTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'YuPearl',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.vertical,
                                    radioButtonColor: const Color(0xFF42BAF1),
                                    inactiveRadioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  70.0, 40.0, 70.0, 0.0),
                              child: Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: CheckboxListTile(
                                  value: _model.needSupplyValue ??= true,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.needSupplyValue = newValue!);
                                  },
                                  title: Text(
                                    '加入聊天室需要申請嗎？',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'YuPearl',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor: const Color(0xFF42BAF1),
                                  checkColor: FlutterFlowTheme.of(context).info,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation3']!),
                    ),
                  ],
                ),
              if (_model.showchoosepage == true)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).accent1,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.chevron_left_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'POSTchevron_left_outlined_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_update_page_state');
                              _model.showchoosepage = false;
                              _model.coursechosed = null;
                              setState(() {});
                              logFirebaseEvent(
                                  'IconButton_clear_text_fields_pin_codes');
                              setState(() {
                                _model.textFieldsearchTextController?.clear();
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).accent1,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.check_sharp,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 26.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'POSTPAGE_PAGE_check_sharp_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_update_page_state');
                                _model.showchoosepage = false;
                                _model.showCourseConfirm = true;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 6.0, 12.0),
                              child: Autocomplete<String>(
                                initialValue: const TextEditingValue(),
                                optionsBuilder: (textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return _model.simpleSearchResults
                                      .map((e) => e.chineseName)
                                      .toList()
                                      .where((option) {
                                    final lowercaseOption =
                                        option.toLowerCase();
                                    return lowercaseOption.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return AutocompleteOptionsList(
                                    textFieldKey: _model.textFieldsearchKey,
                                    textController:
                                        _model.textFieldsearchTextController!,
                                    options: options.toList(),
                                    onSelected: onSelected,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    textHighlightStyle: const TextStyle(),
                                    elevation: 4.0,
                                    optionBackgroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    optionHighlightColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    maxHeight: 200.0,
                                  );
                                },
                                onSelected: (String selection) {
                                  setState(() =>
                                      _model.textFieldsearchSelectedOption =
                                          selection);
                                  FocusScope.of(context).unfocus();
                                },
                                fieldViewBuilder: (
                                  context,
                                  textEditingController,
                                  focusNode,
                                  onEditingComplete,
                                ) {
                                  _model.textFieldsearchFocusNode = focusNode;

                                  _model.textFieldsearchTextController =
                                      textEditingController;
                                  return TextFormField(
                                    key: _model.textFieldsearchKey,
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'POSTTextFieldsearch_ON_TEXTFIELD_SUBMIT');
                                      logFirebaseEvent(
                                          'TextFieldsearch_simple_search');
                                      await queryNthuCoursesRecordOnce()
                                          .then(
                                            (records) => _model
                                                    .simpleSearchResults =
                                                TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.chineseName,
                                                      record.classroom,
                                                      record.teacher
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .textFieldsearchTextController
                                                        .text)
                                                    .map((r) => r.object)
                                                    .toList(),
                                          )
                                          .onError((_, __) =>
                                              _model.simpleSearchResults = [])
                                          .whenComplete(() => setState(() {}));

                                      logFirebaseEvent(
                                          'TextFieldsearch_update_page_state');
                                      _model.showsearch = true;
                                      setState(() {});
                                    },
                                    autofocus: true,
                                    textInputAction: TextInputAction.search,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Work Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: '搜尋課程名稱 (建議打全名)\n',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'YuPearl',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x9B14181B),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .textFieldsearchTextControllerValidator
                                        .asValidator(context),
                                  );
                                },
                              ),
                            ),
                          ),
                          if (_model.showsearch == true)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 25.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context).info,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.close_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'POSTPAGE_PAGE_close_sharp_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_page_state');
                                  _model.showsearch = false;
                                  setState(() {});
                                  logFirebaseEvent(
                                      'IconButton_clear_text_fields_pin_codes');
                                  setState(() {
                                    _model.textFieldsearchTextController
                                        ?.clear();
                                  });
                                  logFirebaseEvent('IconButton_custom_action');
                                  await actions.hideKeyboard();
                                },
                              ).animateOnPageLoad(animationsMap[
                                  'iconButtonOnPageLoadAnimation']!),
                            ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 550.0,
                          decoration: const BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              if (_model.showsearch == false) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: StreamBuilder<List<NthuCoursesRecord>>(
                                    stream: FFAppState().nthuCourseMainCache(
                                      requestFn: () => queryNthuCoursesRecord(
                                        queryBuilder: (nthuCoursesRecord) =>
                                            nthuCoursesRecord.orderBy('index',
                                                descending: true),
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
                                      List<NthuCoursesRecord>
                                          listViewNthuCoursesRecordList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          90.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewNthuCoursesRecordList
                                            .length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewNthuCoursesRecord =
                                              listViewNthuCoursesRecordList[
                                                  listViewIndex];
                                          return Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 20.0, 5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 6.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          0.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        listViewNthuCoursesRecord
                                                                    .reference ==
                                                                _model
                                                                    .coursechosed
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 45.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          listViewNthuCoursesRecord
                                                                              .chineseName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'YuPearl',
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        listViewNthuCoursesRecord
                                                                            .teacher,
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
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Opacity(
                                                          opacity: 0.4,
                                                          child: Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    listViewNthuCoursesRecord
                                                                        .timeString,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'YuPearl',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'POSTPAGE_PAGE_Stack_kyyo9blz_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Stack_update_page_state');
                                                                        _model.coursechosed =
                                                                            listViewNthuCoursesRecord.reference;
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 16.0,
                                                                                height: 16.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  borderRadius: BorderRadius.circular(2.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (listViewNthuCoursesRecord.reference ==
                                                                                _model.coursechosed)
                                                                              Opacity(
                                                                                opacity: 0.8,
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.check_box,
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    size: 20.0,
                                                                                  ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
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
                                                          ],
                                                        ),
                                                        Opacity(
                                                          opacity: 0.7,
                                                          child: Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final searchresult =
                                          _model.simpleSearchResults.toList();
                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          90.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: searchresult.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8.0),
                                        itemBuilder:
                                            (context, searchresultIndex) {
                                          final searchresultItem =
                                              searchresult[searchresultIndex];
                                          return Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 20.0, 5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 6.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          0.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        searchresultItem
                                                                    .reference ==
                                                                _model
                                                                    .coursechosed
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 45.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Text(
                                                                          searchresultItem
                                                                              .chineseName
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                15,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'YuPearl',
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        searchresultItem
                                                                            .teacher
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              12,
                                                                          replacement:
                                                                              '…',
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
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Opacity(
                                                          opacity: 0.4,
                                                          child: Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    searchresultItem
                                                                        .timeString,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'YuPearl',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'POSTPAGE_PAGE_Stack_dcbw4jdz_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Stack_update_page_state');
                                                                        _model.coursechosed =
                                                                            searchresultItem.reference;
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 16.0,
                                                                                height: 16.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  borderRadius: BorderRadius.circular(2.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (searchresultItem.reference ==
                                                                                _model.coursechosed)
                                                                              Opacity(
                                                                                opacity: 0.8,
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.check_box,
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    size: 20.0,
                                                                                  ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
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
                                                          ],
                                                        ),
                                                        Opacity(
                                                          opacity: 0.7,
                                                          child: Divider(
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation4']!),
              if ((_model.coursechosed != null) && _model.showCourseConfirm)
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: StreamBuilder<NthuCoursesRecord>(
                    stream: NthuCoursesRecord.getDocument(_model.coursechosed!),
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
                      final containerNthuCoursesRecord = snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 3.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '已選課程',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    icon: Icon(
                                      Icons.close_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POSTPAGE_PAGE_close_sharp_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_update_page_state');
                                      _model.coursechosed = null;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    containerNthuCoursesRecord.chineseName
                                        .maybeHandleOverflow(maxChars: 30),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 315.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                              ),
                              child: const Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Divider(
                                    thickness: 1.0,
                                    color: Color(0x5C14181B),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    containerNthuCoursesRecord.teacher
                                        .maybeHandleOverflow(maxChars: 20),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Text(
                                  containerNthuCoursesRecord.timeString,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'YuPearl',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
