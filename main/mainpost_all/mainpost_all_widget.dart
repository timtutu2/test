import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/privacy_and_e_u_l_a/eula/eula_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'mainpost_all_model.dart';
export 'mainpost_all_model.dart';

class MainpostAllWidget extends StatefulWidget {
  const MainpostAllWidget({super.key});

  @override
  State<MainpostAllWidget> createState() => _MainpostAllWidgetState();
}

class _MainpostAllWidgetState extends State<MainpostAllWidget>
    with TickerProviderStateMixin {
  late MainpostAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainpostAllModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'mainpost_all'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAINPOST_ALL_mainpost_all_ON_INIT_STATE');
      if (FFAppState().lasttimeOverride == null) {
        logFirebaseEvent('mainpost_all_update_app_state');
        FFAppState().lasttimeOverride = getCurrentTimestamp;
        setState(() {});
      }
      logFirebaseEvent('mainpost_all_custom_action');
      _model.isoverride = await actions.freshCacheTime(
        FFAppState().lasttimeOverride!,
      );
      if (_model.isoverride!) {
        logFirebaseEvent('mainpost_all_update_app_state');
        FFAppState().lasttimeOverride = getCurrentTimestamp;
        FFAppState().isOverride = true;
        setState(() {});
        logFirebaseEvent('mainpost_all_clear_query_cache');
        FFAppState().clearPostAllCacheCache();
        logFirebaseEvent('mainpost_all_wait__delay');
        await Future.delayed(const Duration(milliseconds: 1000));
        logFirebaseEvent('mainpost_all_update_app_state');
        FFAppState().isOverride = false;
        setState(() {});
      }
      if (!FFAppState().EULAgreementApp) {
        logFirebaseEvent('mainpost_all_bottom_sheet');
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
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        logFirebaseEvent('MAINPOST_ALL_TextField_aa5d6zmj_ON_FOCUS');
        logFirebaseEvent('TextField_update_page_state');
        _model.crossShow = true;
        setState(() {});
      },
    );
    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(72.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
              if (_model.showpostdetail == false)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).accent1,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.chevron_left_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MAINPOST_ALL_chevron_left_sharp_ICN_ON_T');
                              logFirebaseEvent('IconButton_navigate_to');

                              context.goNamed(
                                'main',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                  ),
                                },
                              );
                            },
                          ),
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 12.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'MAINPOST_ALL_TextField_aa5d6zmj_ON_TEXTF');
                                          logFirebaseEvent(
                                              'TextField_simple_search');
                                          await queryPostRecordOnce()
                                              .then(
                                                (records) => _model
                                                        .simpleSearchResults =
                                                    TextSearch(
                                                  records
                                                      .map(
                                                        (record) =>
                                                            TextSearchItem
                                                                .fromTerms(
                                                                    record, [
                                                          record.postText,
                                                          record.postInfoMoney,
                                                          record
                                                              .postCourseNameForSearch,
                                                          record
                                                              .postCourseProNameForsearch
                                                        ]),
                                                      )
                                                      .toList(),
                                                )
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList(),
                                              )
                                              .onError((_, __) => _model
                                                  .simpleSearchResults = [])
                                              .whenComplete(
                                                  () => setState(() {}));

                                          logFirebaseEvent(
                                              'TextField_update_page_state');
                                          _model.showSearchinMainpost = true;
                                          setState(() {});
                                        },
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Work Sans',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '搜尋',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
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
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.crossShow)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 30.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 35.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 18.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MAINPOST_ALL_PAGE_close_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_page_state');
                                  _model.showSearchinMainpost = false;
                                  setState(() {});
                                  logFirebaseEvent(
                                      'IconButton_clear_text_fields_pin_codes');
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                  logFirebaseEvent('IconButton_custom_action');
                                  await actions.hideKeyboard();
                                  logFirebaseEvent(
                                      'IconButton_update_page_state');
                                  _model.crossShow = false;
                                  setState(() {});
                                },
                              ).animateOnPageLoad(animationsMap[
                                  'iconButtonOnPageLoadAnimation']!),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FutureBuilder<int>(
                                future: (_model.firestoreRequestCompleter ??=
                                        Completer<int>()
                                          ..complete(
                                              queryInviteAskListRecordCount(
                                            queryBuilder:
                                                (inviteAskListRecord) =>
                                                    inviteAskListRecord
                                                        .where(
                                                          'resceiver',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'have_seen',
                                                          isEqualTo: false,
                                                        ),
                                          )))
                                    .future,
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
                                  int badgeCount = snapshot.data!;
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MAINPOST_ALL_PAGE_Badge_svrkm9cx_ON_TAP');
                                      logFirebaseEvent('Badge_navigate_to');

                                      context.pushNamed('invitepage');
                                    },
                                    child: badges.Badge(
                                      badgeContent: Text(
                                        badgeCount.toString(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'YuPearl',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      showBadge: badgeCount != 0,
                                      shape: badges.BadgeShape.circle,
                                      badgeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      elevation: 4.0,
                                      padding: const EdgeInsets.all(6.0),
                                      position: badges.BadgePosition.topEnd(),
                                      animationType:
                                          badges.BadgeAnimationType.scale,
                                      toAnimate: true,
                                      child: Icon(
                                        Icons.notifications_active,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 14,
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (_model.showSearchinMainpost == false) {
                                    return RefreshIndicator(
                                      key: const Key('RefreshIndicator_v8o69nqq'),
                                      onRefresh: () async {
                                        logFirebaseEvent(
                                            'MAINPOST_ALL_ListView_cs5rqs3x_ON_PULL_T');
                                        logFirebaseEvent(
                                            'ListView_refresh_database_request');
                                        setState(() => _model
                                            .firestoreRequestCompleter = null);
                                        await _model
                                            .waitForFirestoreRequestCompleted();
                                      },
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          PostRecord>.separated(
                                        pagingController:
                                            _model.setListViewController1(
                                          PostRecord.collection.orderBy(
                                              'post_time',
                                              descending: true),
                                        ),
                                        padding: EdgeInsets.zero,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                PostRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),

                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewPostRecord = _model
                                                .listViewPagingController1!
                                                .itemList![listViewIndex];
                                            return Visibility(
                                              visible: ((currentUserDocument
                                                                  ?.hidePost
                                                                  .toList() ??
                                                              [])
                                                          .contains(
                                                              listViewPostRecord
                                                                  .reference) ==
                                                      false) &&
                                                  ((currentUserDocument
                                                                  ?.blockUser
                                                                  .toList() ??
                                                              [])
                                                          .contains(
                                                              listViewPostRecord
                                                                  .postUser) ==
                                                      false),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Stack(
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
                                                                'MAINPOST_ALL_PAGE_Column_adc0wfuw_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Column_update_page_state');
                                                            _model.showsharebutton =
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
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: FutureBuilder<
                                                                        UsersRecord>(
                                                                      future: FFAppState()
                                                                          .postUserInfo(
                                                                        uniqueQueryKey: listViewPostRecord
                                                                            .reference
                                                                            .id,
                                                                        requestFn:
                                                                            () =>
                                                                                UsersRecord.getDocumentOnce(listViewPostRecord.postUser!),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitRipple(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final rowUsersRecord =
                                                                            snapshot.data!;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Builder(
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
                                                                                          const Icon(
                                                                                            Icons.check_circle_rounded,
                                                                                            color: Color(0xFF42BAF1),
                                                                                            size: 12.0,
                                                                                          ),
                                                                                      ],
                                                                                    );
                                                                                  } else {
                                                                                    return Stack(
                                                                                      alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 45.0,
                                                                                          height: 45.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            shape: BoxShape.circle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          child: Icon(
                                                                                            Icons.person,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                        ),
                                                                                        if (functions.verifyemail(rowUsersRecord.email) == true)
                                                                                          const Icon(
                                                                                            Icons.check_circle_rounded,
                                                                                            color: Color(0xFF42BAF1),
                                                                                            size: 12.0,
                                                                                          ),
                                                                                      ],
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
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
                                                                                                        logFirebaseEvent('MAINPOST_ALL_PAGE_user_name_ON_TAP');
                                                                                                        logFirebaseEvent('user_name_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          'link_userprofile',
                                                                                                          queryParameters: {
                                                                                                            'profileUserRef': serializeParam(
                                                                                                              listViewPostRecord.postUser,
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
                                                                                                  if (listViewPostRecord.hasPostCourseInfo2()) {
                                                                                                    return Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                      child: SingleChildScrollView(
                                                                                                        primary: false,
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                              child: AutoSizeText(
                                                                                                                listViewPostRecord.postCourseNameForSearch.maybeHandleOverflow(
                                                                                                                  maxChars: 10,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                                maxLines: 4,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'YuPearl',
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                              child: Text(
                                                                                                                listViewPostRecord.postCourseProNameForsearch.maybeHandleOverflow(maxChars: 10),
                                                                                                                textAlign: TextAlign.center,
                                                                                                                maxLines: 2,
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
                                                                              borderColor: const Color(0x00FFFFFF),
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: const Color(0x00F7F7F7),
                                                                              icon: Icon(
                                                                                Icons.keyboard_control,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('MAINPOST_ALL_keyboard_control_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_update_page_state');
                                                                                _model.showsharebutton = true;
                                                                                _model.tempPost = listViewPostRecord.reference;
                                                                                setState(() {});
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
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
                                                                          listViewPostRecord
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
                                                                          5.0,
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
                                                                      if (listViewPostRecord.postPhoto !=
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
                                                                                listViewPostRecord.postPhoto != '',
                                                                                true,
                                                                              )) {
                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('MAINPOST_ALL_PAGE_Image_8mvwr9yw_ON_TAP');
                                                                                    logFirebaseEvent('Image_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'image_Details_post',
                                                                                      queryParameters: {
                                                                                        'post': serializeParam(
                                                                                          listViewPostRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'clickphotodetail': serializeParam(
                                                                                          listViewPostRecord.postPhoto,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'post': listViewPostRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      listViewPostRecord.postPhoto,
                                                                                      width: 300.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
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
                                                                      if (listViewPostRecord
                                                                              .hasLimitPeopleNum() &&
                                                                          (listViewPostRecord.limitPeopleNum !=
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
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '${listViewPostRecord.joinMember.length.toString()}/${listViewPostRecord.limitPeopleNum.toString()}',
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
                                                                      if (listViewPostRecord
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
                                                                                  listViewPostRecord.postInfoMoney,
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
                                                                            1.0,
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
                                                                                    listViewPostRecord.postTime!,
                                                                                    locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
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
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if (listViewPostRecord.postStatus == true) {
                                                                                  return Builder(
                                                                                    builder: (context) {
                                                                                      if (listViewPostRecord.needApply || (listViewPostRecord.hasNeedApply() == false)) {
                                                                                        return StreamBuilder<List<InvAskListRecord>>(
                                                                                          stream: queryInvAskListRecord(
                                                                                            parent: listViewPostRecord.reference,
                                                                                            singleRecord: true,
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
                                                                                            List<InvAskListRecord> conditionalBuilderInvAskListRecordList = snapshot.data!;
                                                                                            final conditionalBuilderInvAskListRecord = conditionalBuilderInvAskListRecordList.isNotEmpty ? conditionalBuilderInvAskListRecordList.first : null;
                                                                                            return Builder(
                                                                                              builder: (context) {
                                                                                                if (conditionalBuilderInvAskListRecord?.invAskMember.contains(currentUserReference) == true) {
                                                                                                  return FFButtonWidget(
                                                                                                    onPressed: () {
                                                                                                      print('Button pressed ...');
                                                                                                    },
                                                                                                    text: '待審核',
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 90.0,
                                                                                                      height: 25.0,
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'YuPearl',
                                                                                                            color: const Color(0x9714181B),
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: const BorderSide(
                                                                                                        color: Colors.transparent,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
                                                                                                  return Builder(
                                                                                                    builder: (context) {
                                                                                                      if (listViewPostRecord.joinMember.contains(currentUserReference) && (listViewPostRecord.postUser != currentUserReference)) {
                                                                                                        return FFButtonWidget(
                                                                                                          onPressed: () {
                                                                                                            print('Button pressed ...');
                                                                                                          },
                                                                                                          text: '已加入',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 90.0,
                                                                                                            height: 25.0,
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'YuPearl',
                                                                                                                  color: const Color(0x9714181B),
                                                                                                                  fontSize: 10.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                            elevation: 3.0,
                                                                                                            borderSide: const BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        );
                                                                                                      } else {
                                                                                                        return FFButtonWidget(
                                                                                                          onPressed: ((listViewPostRecord.postUser == currentUserReference) || !listViewPostRecord.postStatus || listViewPostRecord.joinMember.contains(currentUserReference))
                                                                                                              ? null
                                                                                                              : () async {
                                                                                                                  logFirebaseEvent('MAINPOST_ALL_PAGE_申請_BTN_ON_TAP');
                                                                                                                  logFirebaseEvent('Button_navigate_to');

                                                                                                                  context.pushNamed(
                                                                                                                    'joinpage',
                                                                                                                    queryParameters: {
                                                                                                                      'postchosed': serializeParam(
                                                                                                                        listViewPostRecord.reference,
                                                                                                                        ParamType.DocumentReference,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                  );
                                                                                                                },
                                                                                                          text: '申請',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 90.0,
                                                                                                            height: 25.0,
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: const Color(0xFF42BAF1),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'YuPearl',
                                                                                                                  color: Colors.white,
                                                                                                                  fontSize: 10.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                            elevation: 3.0,
                                                                                                            borderSide: const BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                            disabledColor: FlutterFlowTheme.of(context).accent1,
                                                                                                            disabledTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          ),
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
                                                                                        return Builder(
                                                                                          builder: (context) {
                                                                                            if (listViewPostRecord.joinMember.contains(currentUserReference) && (listViewPostRecord.postUser != currentUserReference)) {
                                                                                              return FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('Button pressed ...');
                                                                                                },
                                                                                                text: '已加入',
                                                                                                options: FFButtonOptions(
                                                                                                  width: 90.0,
                                                                                                  height: 25.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'YuPearl',
                                                                                                        color: const Color(0x9714181B),
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                  elevation: 3.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                              );
                                                                                            } else {
                                                                                              return FFButtonWidget(
                                                                                                onPressed: ((listViewPostRecord.postUser == currentUserReference) || !listViewPostRecord.postStatus || listViewPostRecord.joinMember.contains(currentUserReference))
                                                                                                    ? null
                                                                                                    : () async {
                                                                                                        logFirebaseEvent('MAINPOST_ALL_PAGE_加入_BTN_ON_TAP');
                                                                                                        if (listViewPostRecord.chatOfPost != null) {
                                                                                                          logFirebaseEvent('Button_firestore_query');
                                                                                                          _model.postchat2 = await queryChatsRecordOnce(
                                                                                                            queryBuilder: (chatsRecord) => chatsRecord.where(
                                                                                                              'post_of_chat',
                                                                                                              isEqualTo: listViewPostRecord.reference,
                                                                                                            ),
                                                                                                            singleRecord: true,
                                                                                                          ).then((s) => s.firstOrNull);
                                                                                                          // updateChat
                                                                                                          logFirebaseEvent('Button_updateChat');

                                                                                                          await listViewPostRecord.chatOfPost!.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'users': FieldValue.arrayUnion([currentUserReference]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                                          await listViewPostRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'join_member': FieldValue.arrayUnion([currentUserReference]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Button_update_page_state');
                                                                                                          _model.navChatDoc = _model.postchat2;
                                                                                                          setState(() {});
                                                                                                          logFirebaseEvent('Button_navigate_to');

                                                                                                          context.pushNamed(
                                                                                                            'chat_2_Details',
                                                                                                            queryParameters: {
                                                                                                              'chatRef': serializeParam(
                                                                                                                _model.navChatDoc,
                                                                                                                ParamType.Document,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                            extra: <String, dynamic>{
                                                                                                              'chatRef': _model.navChatDoc,
                                                                                                            },
                                                                                                          );

                                                                                                          logFirebaseEvent('Button_trigger_push_notification');
                                                                                                          triggerPushNotification(
                                                                                                            notificationTitle: 'Connextion ',
                                                                                                            notificationText: '$currentUserDisplayName  已加入您的貼文聊天室${listViewPostRecord.postChatName}',
                                                                                                            notificationSound: 'default',
                                                                                                            userRefs: [listViewPostRecord.postUser!],
                                                                                                            initialPageName: 'chat_2_Details',
                                                                                                            parameterData: {
                                                                                                              'chatRef': _model.navChatDoc,
                                                                                                            },
                                                                                                          );
                                                                                                        } else {
                                                                                                          logFirebaseEvent('Button_update_page_state');
                                                                                                          _model.addToTempuser(listViewPostRecord.postUser!);
                                                                                                          setState(() {});
                                                                                                          logFirebaseEvent('Button_update_page_state');
                                                                                                          _model.addToTempuser(currentUserReference!);
                                                                                                          setState(() {});
                                                                                                          // newChat
                                                                                                          logFirebaseEvent('Button_newChat');

                                                                                                          var chatsRecordReference = ChatsRecord.collection.doc();
                                                                                                          await chatsRecordReference.set({
                                                                                                            ...createChatsRecordData(
                                                                                                              userA: listViewPostRecord.postUser,
                                                                                                              userB: currentUserReference,
                                                                                                              lastMessage: '',
                                                                                                              lastMessageTime: getCurrentTimestamp,
                                                                                                              groupChatId: listViewPostRecord.chatOfPostID,
                                                                                                              postOfChat: listViewPostRecord.reference,
                                                                                                              chatName: listViewPostRecord.postChatName,
                                                                                                            ),
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'users': _model.tempuser,
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          _model.newChatsecselectsec = ChatsRecord.getDocumentFromData({
                                                                                                            ...createChatsRecordData(
                                                                                                              userA: listViewPostRecord.postUser,
                                                                                                              userB: currentUserReference,
                                                                                                              lastMessage: '',
                                                                                                              lastMessageTime: getCurrentTimestamp,
                                                                                                              groupChatId: listViewPostRecord.chatOfPostID,
                                                                                                              postOfChat: listViewPostRecord.reference,
                                                                                                              chatName: listViewPostRecord.postChatName,
                                                                                                            ),
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'users': _model.tempuser,
                                                                                                              },
                                                                                                            ),
                                                                                                          }, chatsRecordReference);
                                                                                                          logFirebaseEvent('Button_update_page_state');
                                                                                                          _model.tempuser = [];
                                                                                                          setState(() {});
                                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                                          await listViewPostRecord.reference.update({
                                                                                                            ...createPostRecordData(
                                                                                                              chatOfPost: _model.newChatsecselectsec?.reference,
                                                                                                            ),
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'join_member': FieldValue.arrayUnion([currentUserReference]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          logFirebaseEvent('Button_navigate_to');

                                                                                                          context.goNamed(
                                                                                                            'chat_2_Details',
                                                                                                            queryParameters: {
                                                                                                              'chatRef': serializeParam(
                                                                                                                _model.newChatsecselectsec,
                                                                                                                ParamType.Document,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                            extra: <String, dynamic>{
                                                                                                              'chatRef': _model.newChatsecselectsec,
                                                                                                            },
                                                                                                          );

                                                                                                          logFirebaseEvent('Button_trigger_push_notification');
                                                                                                          triggerPushNotification(
                                                                                                            notificationTitle: 'Connextion ',
                                                                                                            notificationText: '$currentUserDisplayName  已加入您的貼文聊天室${listViewPostRecord.postChatName}',
                                                                                                            notificationSound: 'default',
                                                                                                            userRefs: [listViewPostRecord.postUser!],
                                                                                                            initialPageName: 'chat_2_Details',
                                                                                                            parameterData: {
                                                                                                              'chatRef': _model.newChatsecselectsec,
                                                                                                            },
                                                                                                          );
                                                                                                        }

                                                                                                        setState(() {});
                                                                                                      },
                                                                                                text: '加入',
                                                                                                options: FFButtonOptions(
                                                                                                  width: 90.0,
                                                                                                  height: 25.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0xFF42BAF1),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'YuPearl',
                                                                                                        color: Colors.white,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                  elevation: 3.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                  disabledColor: FlutterFlowTheme.of(context).accent1,
                                                                                                  disabledTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  return FFButtonWidget(
                                                                                    onPressed: (listViewPostRecord.postStatus == false)
                                                                                        ? null
                                                                                        : () {
                                                                                            print('Button pressed ...');
                                                                                          },
                                                                                    text: '已關閉',
                                                                                    options: FFButtonOptions(
                                                                                      width: 90.0,
                                                                                      height: 25.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'YuPearl',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                      disabledColor: FlutterFlowTheme.of(context).accent1,
                                                                                      disabledTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
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
                                                      if ((_model.showsharebutton ==
                                                              true) &&
                                                          (_model.tempPost ==
                                                              listViewPostRecord
                                                                  .reference))
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
                                                              width: 98.0,
                                                              height: 141.0,
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
                                                                              logFirebaseEvent('MAINPOST_ALL_PAGE_更多_BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_navigate_to');

                                                                              context.pushNamed(
                                                                                'link_post',
                                                                                queryParameters: {
                                                                                  'postref': serializeParam(
                                                                                    listViewPostRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            text:
                                                                                '更多',
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.more,
                                                                              size: 12.0,
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
                                                                                    fontSize: 8.0,
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
                                                                              logFirebaseEvent('MAINPOST_ALL_PAGE_收藏_BTN_ON_TAP');
                                                                              if ((currentUserDocument?.lovePostCollection.toList() ?? []).contains(listViewPostRecord.reference)) {
                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                _model.showsharebutton = false;
                                                                                setState(() {});
                                                                              } else {
                                                                                logFirebaseEvent('Button_backend_call');

                                                                                await currentUserReference!.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'love_post_collection': FieldValue.arrayUnion([
                                                                                        listViewPostRecord.reference
                                                                                      ]),
                                                                                      'Post_collection': FieldValue.arrayUnion([
                                                                                        getPostWithTimeFirestoreData(
                                                                                          updatePostWithTimeStruct(
                                                                                            PostWithTimeStruct(
                                                                                              postCollection: listViewPostRecord.reference,
                                                                                              addTime: getCurrentTimestamp,
                                                                                            ),
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          true,
                                                                                        )
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                _model.showsharebutton = false;
                                                                                setState(() {});
                                                                              }
                                                                            },
                                                                            text:
                                                                                '收藏',
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.favorite_sharp,
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
                                                                                    fontSize: 8.0,
                                                                                    letterSpacing: 2.0,
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
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'MAINPOST_ALL_PAGE_隱藏_BTN_ON_TAP');
                                                                          if ((currentUserDocument?.hidePost.toList() ?? [])
                                                                              .contains(listViewPostRecord.reference)) {
                                                                            logFirebaseEvent('Button_update_page_state');
                                                                            _model.showsharebutton =
                                                                                false;
                                                                            setState(() {});
                                                                          } else {
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'hide_post': FieldValue.arrayUnion([
                                                                                    listViewPostRecord.reference
                                                                                  ]),
                                                                                  'hide_post_time_co': FieldValue.arrayUnion([
                                                                                    getPostWithTimeFirestoreData(
                                                                                      updatePostWithTimeStruct(
                                                                                        PostWithTimeStruct(
                                                                                          postCollection: listViewPostRecord.reference,
                                                                                          addTime: getCurrentTimestamp,
                                                                                        ),
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      true,
                                                                                    )
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            logFirebaseEvent('Button_update_page_state');
                                                                            _model.showsharebutton =
                                                                                false;
                                                                            setState(() {});
                                                                          }
                                                                        },
                                                                        text:
                                                                            '隱藏',
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .hide_source_sharp,
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
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'YuPearl',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 8.0,
                                                                                letterSpacing: 2.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
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
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final searchResult = _model
                                              .simpleSearchResults
                                              .toList();
                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: searchResult.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, searchResultIndex) {
                                              final searchResultItem =
                                                  searchResult[
                                                      searchResultIndex];
                                              return Visibility(
                                                visible: ((currentUserDocument
                                                                    ?.hidePost
                                                                    .toList() ??
                                                                [])
                                                            .contains(
                                                                searchResultItem
                                                                    .reference) ==
                                                        false) &&
                                                    ((currentUserDocument
                                                                    ?.blockUser
                                                                    .toList() ??
                                                                [])
                                                            .contains(
                                                                searchResultItem
                                                                    .postUser) ==
                                                        false),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Stack(
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'MAINPOST_ALL_PAGE_Column_006ek753_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Column_update_page_state');
                                                              _model.showsharebutton =
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
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: FutureBuilder<
                                                                          UsersRecord>(
                                                                        future:
                                                                            FFAppState().postUserInfo(
                                                                          uniqueQueryKey: searchResultItem
                                                                              .reference
                                                                              .id,
                                                                          requestFn: () =>
                                                                              UsersRecord.getDocumentOnce(searchResultItem.postUser!),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          final rowUsersRecord =
                                                                              snapshot.data!;
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Builder(
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
                                                                                            const Icon(
                                                                                              Icons.check_circle_rounded,
                                                                                              color: Color(0xFF42BAF1),
                                                                                              size: 12.0,
                                                                                            ),
                                                                                        ],
                                                                                      );
                                                                                    } else {
                                                                                      return Stack(
                                                                                        alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 45.0,
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              shape: BoxShape.circle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            child: Icon(
                                                                                              Icons.person,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 22.0,
                                                                                            ),
                                                                                          ),
                                                                                          if (functions.verifyemail(rowUsersRecord.email) == true)
                                                                                            const Icon(
                                                                                              Icons.check_circle_rounded,
                                                                                              color: Color(0xFF42BAF1),
                                                                                              size: 12.0,
                                                                                            ),
                                                                                        ],
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Container(
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
                                                                                                          logFirebaseEvent('MAINPOST_ALL_PAGE_user_name_ON_TAP');
                                                                                                          logFirebaseEvent('user_name_custom_action');
                                                                                                          _model.existuserall = await actions.ifdofisexistUser(
                                                                                                            rowUsersRecord.reference,
                                                                                                          );
                                                                                                          if (_model.existuserall!) {
                                                                                                            logFirebaseEvent('user_name_navigate_to');

                                                                                                            context.pushNamed(
                                                                                                              'link_userprofile',
                                                                                                              queryParameters: {
                                                                                                                'profileUserRef': serializeParam(
                                                                                                                  searchResultItem.postUser,
                                                                                                                  ParamType.DocumentReference,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          } else {
                                                                                                            logFirebaseEvent('user_name_show_snack_bar');
                                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                                              SnackBar(
                                                                                                                content: Text(
                                                                                                                  '用戶不存在',
                                                                                                                  style: TextStyle(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                duration: const Duration(milliseconds: 2000),
                                                                                                                backgroundColor: const Color(0xFF42BAF1),
                                                                                                              ),
                                                                                                            );
                                                                                                          }

                                                                                                          setState(() {});
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
                                                                                                    if (searchResultItem.hasPostCourseInfo2()) {
                                                                                                      return Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: SingleChildScrollView(
                                                                                                          primary: false,
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                child: AutoSizeText(
                                                                                                                  searchResultItem.postCourseNameForSearch,
                                                                                                                  maxLines: 4,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'YuPearl',
                                                                                                                        fontSize: 12.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  searchResultItem.postCourseProNameForsearch.maybeHandleOverflow(maxChars: 10),
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  maxLines: 2,
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
                                                                                borderColor: const Color(0x00FFFFFF),
                                                                                borderRadius: 20.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 40.0,
                                                                                fillColor: const Color(0x00F7F7F7),
                                                                                icon: Icon(
                                                                                  Icons.keyboard_control,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('MAINPOST_ALL_keyboard_control_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_update_page_state');
                                                                                  _model.showsharebutton = true;
                                                                                  _model.tempPost = searchResultItem.reference;
                                                                                  setState(() {});
                                                                                },
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
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
                                                                            searchResultItem.postText,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (searchResultItem.postPhoto !=
                                                                                '')
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                15.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if (valueOrDefault<bool>(
                                                                                  searchResultItem.postPhoto != '',
                                                                                  true,
                                                                                )) {
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('MAINPOST_ALL_PAGE_Image_1lonkpc2_ON_TAP');
                                                                                      logFirebaseEvent('Image_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'image_Details_post',
                                                                                        queryParameters: {
                                                                                          'post': serializeParam(
                                                                                            searchResultItem,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'clickphotodetail': serializeParam(
                                                                                            searchResultItem.postPhoto,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'post': searchResultItem,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        searchResultItem.postPhoto,
                                                                                        width: 300.0,
                                                                                        height: 200.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
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
                                                                        if ((searchResultItem.limitPeopleNum !=
                                                                                null) &&
                                                                            (searchResultItem.limitPeopleNum !=
                                                                                0))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${searchResultItem.joinMember.length.toString()}/${searchResultItem.limitPeopleNum.toString()}',
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
                                                                        if (searchResultItem.postInfoMoney !=
                                                                                '')
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                1.0,
                                                                                5.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                                                                    searchResultItem.postInfoMoney,
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
                                                                              1.0,
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
                                                                                      searchResultItem.postTime!,
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
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  if (searchResultItem.postStatus == true) {
                                                                                    return Builder(
                                                                                      builder: (context) {
                                                                                        if (searchResultItem.needApply || (searchResultItem.hasNeedApply() == false)) {
                                                                                          return StreamBuilder<List<InvAskListRecord>>(
                                                                                            stream: queryInvAskListRecord(
                                                                                              parent: searchResultItem.reference,
                                                                                              singleRecord: true,
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
                                                                                              List<InvAskListRecord> conditionalBuilderInvAskListRecordList = snapshot.data!;
                                                                                              final conditionalBuilderInvAskListRecord = conditionalBuilderInvAskListRecordList.isNotEmpty ? conditionalBuilderInvAskListRecordList.first : null;
                                                                                              return Builder(
                                                                                                builder: (context) {
                                                                                                  if (conditionalBuilderInvAskListRecord?.invAskMember.contains(currentUserReference) == true) {
                                                                                                    return FFButtonWidget(
                                                                                                      onPressed: () {
                                                                                                        print('Button pressed ...');
                                                                                                      },
                                                                                                      text: '待審核',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 90.0,
                                                                                                        height: 25.0,
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'YuPearl',
                                                                                                              color: const Color(0x9714181B),
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                        elevation: 3.0,
                                                                                                        borderSide: const BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                      ),
                                                                                                    );
                                                                                                  } else {
                                                                                                    return Builder(
                                                                                                      builder: (context) {
                                                                                                        if ((searchResultItem.joinMember.where((e) => e == currentUserReference).toList().isNotEmpty) && (searchResultItem.postUser != currentUserReference)) {
                                                                                                          return FFButtonWidget(
                                                                                                            onPressed: () {
                                                                                                              print('Button pressed ...');
                                                                                                            },
                                                                                                            text: '已加入',
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 90.0,
                                                                                                              height: 25.0,
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'YuPearl',
                                                                                                                    color: const Color(0x9714181B),
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              elevation: 3.0,
                                                                                                              borderSide: const BorderSide(
                                                                                                                color: Colors.transparent,
                                                                                                                width: 1.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                                            ),
                                                                                                          );
                                                                                                        } else {
                                                                                                          return FFButtonWidget(
                                                                                                            onPressed: ((searchResultItem.postUser == currentUserReference) || !searchResultItem.postStatus || searchResultItem.joinMember.contains(currentUserReference))
                                                                                                                ? null
                                                                                                                : () async {
                                                                                                                    logFirebaseEvent('MAINPOST_ALL_PAGE_申請_BTN_ON_TAP');
                                                                                                                    logFirebaseEvent('Button_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      'joinpage',
                                                                                                                      queryParameters: {
                                                                                                                        'postchosed': serializeParam(
                                                                                                                          searchResultItem.reference,
                                                                                                                          ParamType.DocumentReference,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  },
                                                                                                            text: '申請',
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 90.0,
                                                                                                              height: 25.0,
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: const Color(0xFF42BAF1),
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'YuPearl',
                                                                                                                    color: Colors.white,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              elevation: 3.0,
                                                                                                              borderSide: const BorderSide(
                                                                                                                color: Colors.transparent,
                                                                                                                width: 1.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                                              disabledColor: FlutterFlowTheme.of(context).accent1,
                                                                                                              disabledTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            ),
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
                                                                                          return Builder(
                                                                                            builder: (context) {
                                                                                              if ((searchResultItem.joinMember.where((e) => e == currentUserReference).toList().isNotEmpty) && (searchResultItem.postUser != currentUserReference)) {
                                                                                                return FFButtonWidget(
                                                                                                  onPressed: () {
                                                                                                    print('Button pressed ...');
                                                                                                  },
                                                                                                  text: '已加入',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 90.0,
                                                                                                    height: 25.0,
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'YuPearl',
                                                                                                          color: const Color(0x9714181B),
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: const BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                return FFButtonWidget(
                                                                                                  onPressed: ((searchResultItem.postUser == currentUserReference) || !searchResultItem.postStatus || searchResultItem.joinMember.contains(currentUserReference))
                                                                                                      ? null
                                                                                                      : () async {
                                                                                                          logFirebaseEvent('MAINPOST_ALL_PAGE_加入_BTN_ON_TAP');
                                                                                                          if (searchResultItem.chatOfPost != null) {
                                                                                                            // updateChat
                                                                                                            logFirebaseEvent('Button_updateChat');

                                                                                                            await searchResultItem.chatOfPost!.update({
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'users': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                                            await searchResultItem.reference.update({
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'join_member': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                                            _model.chatdocsecSearchselectsec = await actions.getDocReffromchat(
                                                                                                              searchResultItem.chatOfPost!,
                                                                                                            );
                                                                                                            logFirebaseEvent('Button_navigate_to');

                                                                                                            context.goNamed(
                                                                                                              'chat_2_Details',
                                                                                                              queryParameters: {
                                                                                                                'chatRef': serializeParam(
                                                                                                                  _model.chatdocsecSearchselectsec,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                'chatRef': _model.chatdocsecSearchselectsec,
                                                                                                              },
                                                                                                            );

                                                                                                            logFirebaseEvent('Button_trigger_push_notification');
                                                                                                            triggerPushNotification(
                                                                                                              notificationTitle: 'Connextion ',
                                                                                                              notificationText: '$currentUserDisplayName  已加入您的貼文聊天室${searchResultItem.postChatName}',
                                                                                                              notificationSound: 'default',
                                                                                                              userRefs: [searchResultItem.postUser!],
                                                                                                              initialPageName: 'chat_2_Details',
                                                                                                              parameterData: {
                                                                                                                'chatRef': _model.chatdocsecSearchselectsec,
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            logFirebaseEvent('Button_update_page_state');
                                                                                                            _model.addToTempuser(searchResultItem.postUser!);
                                                                                                            setState(() {});
                                                                                                            logFirebaseEvent('Button_update_page_state');
                                                                                                            _model.addToTempuser(currentUserReference!);
                                                                                                            setState(() {});
                                                                                                            // newChat
                                                                                                            logFirebaseEvent('Button_newChat');

                                                                                                            var chatsRecordReference = ChatsRecord.collection.doc();
                                                                                                            await chatsRecordReference.set({
                                                                                                              ...createChatsRecordData(
                                                                                                                userA: searchResultItem.postUser,
                                                                                                                userB: currentUserReference,
                                                                                                                lastMessage: '',
                                                                                                                lastMessageTime: getCurrentTimestamp,
                                                                                                                groupChatId: searchResultItem.chatOfPostID,
                                                                                                                postOfChat: searchResultItem.reference,
                                                                                                                chatName: searchResultItem.postChatName,
                                                                                                              ),
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'users': _model.tempuser,
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                            _model.newChatsecSearchselectsec = ChatsRecord.getDocumentFromData({
                                                                                                              ...createChatsRecordData(
                                                                                                                userA: searchResultItem.postUser,
                                                                                                                userB: currentUserReference,
                                                                                                                lastMessage: '',
                                                                                                                lastMessageTime: getCurrentTimestamp,
                                                                                                                groupChatId: searchResultItem.chatOfPostID,
                                                                                                                postOfChat: searchResultItem.reference,
                                                                                                                chatName: searchResultItem.postChatName,
                                                                                                              ),
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'users': _model.tempuser,
                                                                                                                },
                                                                                                              ),
                                                                                                            }, chatsRecordReference);
                                                                                                            logFirebaseEvent('Button_update_page_state');
                                                                                                            _model.tempuser = [];
                                                                                                            setState(() {});
                                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                                            await searchResultItem.reference.update({
                                                                                                              ...createPostRecordData(
                                                                                                                chatOfPost: _model.newChatsecSearchselectsec?.reference,
                                                                                                              ),
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'join_member': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                            logFirebaseEvent('Button_navigate_to');

                                                                                                            context.goNamed(
                                                                                                              'chat_2_Details',
                                                                                                              queryParameters: {
                                                                                                                'chatRef': serializeParam(
                                                                                                                  _model.newChatsecSearchselectsec,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                'chatRef': _model.newChatsecSearchselectsec,
                                                                                                              },
                                                                                                            );

                                                                                                            logFirebaseEvent('Button_trigger_push_notification');
                                                                                                            triggerPushNotification(
                                                                                                              notificationTitle: 'Connextion ',
                                                                                                              notificationText: '$currentUserDisplayName  已加入您的貼文聊天室${searchResultItem.postChatName}',
                                                                                                              notificationSound: 'default',
                                                                                                              userRefs: [searchResultItem.postUser!],
                                                                                                              initialPageName: 'chat_2_Details',
                                                                                                              parameterData: {
                                                                                                                'chatRef': _model.newChatsecSearchselectsec,
                                                                                                              },
                                                                                                            );
                                                                                                          }

                                                                                                          setState(() {});
                                                                                                        },
                                                                                                  text: '加入',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 90.0,
                                                                                                    height: 25.0,
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: const Color(0xFF42BAF1),
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'YuPearl',
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                    elevation: 3.0,
                                                                                                    borderSide: const BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                    disabledColor: FlutterFlowTheme.of(context).accent1,
                                                                                                    disabledTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    return FFButtonWidget(
                                                                                      onPressed: (searchResultItem.postStatus == false)
                                                                                          ? null
                                                                                          : () {
                                                                                              print('Button pressed ...');
                                                                                            },
                                                                                      text: '已關閉',
                                                                                      options: FFButtonOptions(
                                                                                        width: 90.0,
                                                                                        height: 25.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'YuPearl',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                        elevation: 2.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        disabledColor: FlutterFlowTheme.of(context).accent1,
                                                                                        disabledTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const Opacity(
                                                                    opacity:
                                                                        0.7,
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
                                                        if ((_model.showsharebutton ==
                                                                true) &&
                                                            (_model.tempPost ==
                                                                searchResultItem
                                                                    .reference))
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
                                                                width: 98.0,
                                                                height: 141.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0x9B9E9D9D),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                                  padding: const EdgeInsetsDirectional
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
                                                                          width:
                                                                              double.infinity,
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
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('MAINPOST_ALL_PAGE_更多_BTN_ON_TAP');
                                                                                logFirebaseEvent('Button_navigate_to');

                                                                                context.pushNamed(
                                                                                  'link_post',
                                                                                  queryParameters: {
                                                                                    'postref': serializeParam(
                                                                                      searchResultItem.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: '更多',
                                                                              icon: const Icon(
                                                                                Icons.more,
                                                                                size: 12.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 30.0,
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'YuPearl',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 8.0,
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
                                                                          width:
                                                                              double.infinity,
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
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('MAINPOST_ALL_PAGE_收藏_BTN_ON_TAP');
                                                                                if ((currentUserDocument?.lovePostCollection.toList() ?? []).contains(searchResultItem.reference)) {
                                                                                  logFirebaseEvent('Button_update_page_state');
                                                                                  _model.showsharebutton = false;
                                                                                  setState(() {});
                                                                                } else {
                                                                                  logFirebaseEvent('Button_backend_call');

                                                                                  await currentUserReference!.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'love_post_collection': FieldValue.arrayUnion([
                                                                                          searchResultItem.reference
                                                                                        ]),
                                                                                        'Post_collection': FieldValue.arrayUnion([
                                                                                          getPostWithTimeFirestoreData(
                                                                                            updatePostWithTimeStruct(
                                                                                              PostWithTimeStruct(
                                                                                                postCollection: searchResultItem.reference,
                                                                                                addTime: getCurrentTimestamp,
                                                                                              ),
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                            true,
                                                                                          )
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  logFirebaseEvent('Button_update_page_state');
                                                                                  _model.showsharebutton = false;
                                                                                  setState(() {});
                                                                                }
                                                                              },
                                                                              text: '收藏',
                                                                              icon: const Icon(
                                                                                Icons.favorite,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 30.0,
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'YuPearl',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 2.0,
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
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('MAINPOST_ALL_PAGE_隱藏_BTN_ON_TAP');
                                                                            if ((currentUserDocument?.hidePost.toList() ?? []).contains(searchResultItem.reference)) {
                                                                              logFirebaseEvent('Button_update_page_state');
                                                                              _model.showsharebutton = false;
                                                                              setState(() {});
                                                                            } else {
                                                                              logFirebaseEvent('Button_backend_call');

                                                                              await currentUserReference!.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'hide_post': FieldValue.arrayUnion([
                                                                                      searchResultItem.reference
                                                                                    ]),
                                                                                    'hide_post_time_co': FieldValue.arrayUnion([
                                                                                      getPostWithTimeFirestoreData(
                                                                                        updatePostWithTimeStruct(
                                                                                          PostWithTimeStruct(
                                                                                            postCollection: searchResultItem.reference,
                                                                                            addTime: getCurrentTimestamp,
                                                                                          ),
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        true,
                                                                                      )
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              logFirebaseEvent('Button_update_page_state');
                                                                              _model.showsharebutton = false;
                                                                              setState(() {});
                                                                            }
                                                                          },
                                                                          text:
                                                                              '隱藏',
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.hide_source_sharp,
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
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 2.0,
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
                                                ),
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
    );
  }
}
