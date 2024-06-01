import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:text_search/text_search.dart';
import 'u_collection_postpage_model.dart';
export 'u_collection_postpage_model.dart';

class UCollectionPostpageWidget extends StatefulWidget {
  const UCollectionPostpageWidget({super.key});

  @override
  State<UCollectionPostpageWidget> createState() =>
      _UCollectionPostpageWidgetState();
}

class _UCollectionPostpageWidgetState extends State<UCollectionPostpageWidget>
    with TickerProviderStateMixin {
  late UCollectionPostpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UCollectionPostpageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'uCollectionPostpage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('U_COLLECTION_POSTuCollectionPostpage_ON_');
      logFirebaseEvent('uCollectionPostpage_custom_action');
      _model.postCollectionReverse = await actions.reverseAction(
        (currentUserDocument?.postCollection.toList() ?? []).toList(),
      );
      logFirebaseEvent('uCollectionPostpage_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'Post_collection': getPostWithTimeListFirestoreData(
              _model.postCollectionReverse,
            ),
          },
        ),
      });
      while (_model.tempnumber! <
          (currentUserDocument?.postCollection.toList() ?? []).length) {
        logFirebaseEvent('uCollectionPostpage_custom_action');
        _model.exist = await actions.ifdofisexistPost(
          (currentUserDocument?.postCollection.toList() ??
                  [])[_model.tempnumber!]
              .postCollection!,
        );
        if (_model.exist!) {
          logFirebaseEvent('uCollectionPostpage_update_page_state');
          _model.addToDontneedDeleteRef(
              (currentUserDocument?.postCollection.toList() ??
                  [])[_model.tempnumber!]);
          setState(() {});
          logFirebaseEvent('uCollectionPostpage_update_page_state');
          _model.addToDontneeddeletepost(
              (currentUserDocument?.postCollection.toList() ??
                      [])[_model.tempnumber!]
                  .postCollection!);
          setState(() {});
        }
        logFirebaseEvent('uCollectionPostpage_update_page_state');
        _model.tempnumber = _model.tempnumber! + 1;
        setState(() {});
      }
      logFirebaseEvent('uCollectionPostpage_backend_call');

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'Post_collection': getPostWithTimeListFirestoreData(
              _model.dontneedDeleteRef,
            ),
            'love_post_collection': _model.dontneeddeletepost,
          },
        ),
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
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
                                  'U_COLLECTION_POSTarrow_back_rounded_ICN_');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.safePop();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              70.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'YuPearl',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Text(
                          '的收藏貼文',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'YuPearl',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
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
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 5.0, 12.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onFieldSubmitted: (_) async {
                                        logFirebaseEvent(
                                            'U_COLLECTION_POSTTextField_85s17x6x_ON_T');
                                        logFirebaseEvent(
                                            'TextField_firestore_query');
                                        _model.postquery =
                                            await queryPostRecordOnce();
                                        while (_model.tempnum <
                                            (currentUserDocument
                                                        ?.lovePostCollection
                                                        .toList() ??
                                                    [])
                                                .length) {
                                          logFirebaseEvent(
                                              'TextField_update_page_state');
                                          _model.addToTempLovelist(_model
                                              .postquery!
                                              .where((e) =>
                                                  e.reference ==
                                                  (currentUserDocument
                                                          ?.lovePostCollection
                                                          .toList() ??
                                                      [])[_model.tempnum])
                                              .toList()
                                              .first);
                                          setState(() {});
                                          logFirebaseEvent(
                                              'TextField_update_page_state');
                                          _model.tempnum = _model.tempnum + 1;
                                          setState(() {});
                                        }
                                        logFirebaseEvent(
                                            'TextField_simple_search');
                                        safeSetState(() {
                                          _model
                                              .simpleSearchResults = TextSearch(
                                            _model.tempLovelist
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record,
                                                          [record.postText]),
                                                )
                                                .toList(),
                                          )
                                              .search(
                                                  _model.textController.text)
                                              .map((r) => r.object)
                                              .toList();
                                        });
                                        logFirebaseEvent(
                                            'TextField_update_page_state');
                                        _model.showSearchaction = true;
                                        setState(() {});

                                        setState(() {});
                                      },
                                      autofocus: false,
                                      textInputAction: TextInputAction.search,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Work Sans',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: '搜尋...',
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
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_model.showSearchaction)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 15.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 35.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'U_COLLECTION_POSTclose_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_update_page_state');
                                _model.showSearchaction = false;
                                setState(() {});
                                logFirebaseEvent(
                                    'IconButton_clear_text_fields_pin_codes');
                                setState(() {
                                  _model.textController?.clear();
                                });
                              },
                            ).animateOnPageLoad(animationsMap[
                                'iconButtonOnPageLoadAnimation']!),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (_model.showSearchaction == false) {
                                  return AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final lovePostlist =
                                            (currentUserDocument?.postCollection
                                                        .toList() ??
                                                    [])
                                                .toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: lovePostlist.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, lovePostlistIndex) {
                                            final lovePostlistItem =
                                                lovePostlist[lovePostlistIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: StreamBuilder<PostRecord>(
                                                stream: FFAppState()
                                                    .uCollectionPost(
                                                  uniqueQueryKey:
                                                      lovePostlistItem
                                                          .postCollection?.id,
                                                  requestFn: () =>
                                                      PostRecord.getDocument(
                                                          lovePostlistItem
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
                                                                'U_COLLECTION_POSTColumn_cy846xnc_ON_TAP');
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
                                                                                                      logFirebaseEvent('U_COLLECTION_POSTuser_name_ON_TAP');
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
                                                                              logFirebaseEvent('U_COLLECTION_POSTkeyboard_control_ICN_ON');
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
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if (stackPostRecord.postStatus == true) {
                                                                                  return StreamBuilder<List<InvAskListRecord>>(
                                                                                    stream: FFAppState().invMemberSaftyMode(
                                                                                      uniqueQueryKey: stackPostRecord.reference.id,
                                                                                      requestFn: () => queryInvAskListRecord(
                                                                                        parent: stackPostRecord.reference,
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
                                                                                          if (conditionalBuilderInvAskListRecord != null) {
                                                                                            return Builder(
                                                                                              builder: (context) {
                                                                                                if (conditionalBuilderInvAskListRecord.invAskMember.contains(currentUserReference) == true) {
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
                                                                                                      color: const Color(0x2157636C),
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'YuPearl',
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
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
                                                                                                      if (stackPostRecord.joinMember.contains(currentUserReference) && (stackPostRecord.postUser != currentUserReference)) {
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
                                                                                                            color: const Color(0x2157636C),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: 'YuPearl',
                                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                                  fontSize: 10.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                            elevation: 3.0,
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                        );
                                                                                                      } else {
                                                                                                        return Builder(
                                                                                                          builder: (context) {
                                                                                                            if (stackPostRecord.needApply || (stackPostRecord.hasNeedApply() == false)) {
                                                                                                              return FFButtonWidget(
                                                                                                                onPressed: ((stackPostRecord.postUser == currentUserReference) || !stackPostRecord.postStatus || stackPostRecord.joinMember.contains(currentUserReference))
                                                                                                                    ? null
                                                                                                                    : () async {
                                                                                                                        logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_申請_BTN_ON_TAP');
                                                                                                                        logFirebaseEvent('Button_navigate_to');

                                                                                                                        context.pushNamed(
                                                                                                                          'joinpage',
                                                                                                                          queryParameters: {
                                                                                                                            'postchosed': serializeParam(
                                                                                                                              stackPostRecord.reference,
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
                                                                                                            } else {
                                                                                                              return FFButtonWidget(
                                                                                                                onPressed: ((stackPostRecord.postUser == currentUserReference) || !stackPostRecord.postStatus || stackPostRecord.joinMember.contains(currentUserReference))
                                                                                                                    ? null
                                                                                                                    : () async {
                                                                                                                        logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_加入_BTN_ON_TAP');
                                                                                                                        if (stackPostRecord.chatOfPost != null) {
                                                                                                                          // updateChat
                                                                                                                          logFirebaseEvent('Button_updateChat');

                                                                                                                          await stackPostRecord.chatOfPost!.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'users': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                                                          await stackPostRecord.reference.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'join_member': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                                                          _model.chatdocucollect = await actions.getDocReffromchat(
                                                                                                                            stackPostRecord.chatOfPost!,
                                                                                                                          );
                                                                                                                          logFirebaseEvent('Button_navigate_to');

                                                                                                                          context.goNamed(
                                                                                                                            'chat_2_Details',
                                                                                                                            queryParameters: {
                                                                                                                              'chatRef': serializeParam(
                                                                                                                                _model.chatdocucollect,
                                                                                                                                ParamType.Document,
                                                                                                                              ),
                                                                                                                            }.withoutNulls,
                                                                                                                            extra: <String, dynamic>{
                                                                                                                              'chatRef': _model.chatdocucollect,
                                                                                                                            },
                                                                                                                          );

                                                                                                                          logFirebaseEvent('Button_trigger_push_notification');
                                                                                                                          triggerPushNotification(
                                                                                                                            notificationTitle: 'Connextion ',
                                                                                                                            notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                            notificationSound: 'default',
                                                                                                                            userRefs: [stackPostRecord.postUser!],
                                                                                                                            initialPageName: 'chat_2_Details',
                                                                                                                            parameterData: {
                                                                                                                              'chatRef': _model.chatdocucollect,
                                                                                                                            },
                                                                                                                          );
                                                                                                                        } else {
                                                                                                                          // newChat
                                                                                                                          logFirebaseEvent('Button_newChat');

                                                                                                                          var chatsRecordReference = ChatsRecord.collection.doc();
                                                                                                                          await chatsRecordReference.set({
                                                                                                                            ...createChatsRecordData(
                                                                                                                              userA: stackPostRecord.postUser,
                                                                                                                              userB: currentUserReference,
                                                                                                                              lastMessage: '',
                                                                                                                              lastMessageTime: getCurrentTimestamp,
                                                                                                                              groupChatId: stackPostRecord.chatOfPostID,
                                                                                                                              postOfChat: stackPostRecord.reference,
                                                                                                                              chatName: stackPostRecord.postChatName,
                                                                                                                            ),
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'users': [stackPostRecord.postUser],
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                          _model.newChatucollect = ChatsRecord.getDocumentFromData({
                                                                                                                            ...createChatsRecordData(
                                                                                                                              userA: stackPostRecord.postUser,
                                                                                                                              userB: currentUserReference,
                                                                                                                              lastMessage: '',
                                                                                                                              lastMessageTime: getCurrentTimestamp,
                                                                                                                              groupChatId: stackPostRecord.chatOfPostID,
                                                                                                                              postOfChat: stackPostRecord.reference,
                                                                                                                              chatName: stackPostRecord.postChatName,
                                                                                                                            ),
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'users': [stackPostRecord.postUser],
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          }, chatsRecordReference);
                                                                                                                          logFirebaseEvent('Button_backend_call');

                                                                                                                          await stackPostRecord.reference.update({
                                                                                                                            ...createPostRecordData(
                                                                                                                              chatOfPost: _model.newChatucollect?.reference,
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
                                                                                                                                _model.newChatucollect,
                                                                                                                                ParamType.Document,
                                                                                                                              ),
                                                                                                                            }.withoutNulls,
                                                                                                                            extra: <String, dynamic>{
                                                                                                                              'chatRef': _model.newChatucollect,
                                                                                                                            },
                                                                                                                          );

                                                                                                                          logFirebaseEvent('Button_trigger_push_notification');
                                                                                                                          triggerPushNotification(
                                                                                                                            notificationTitle: 'Connextion ',
                                                                                                                            notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                            notificationSound: 'default',
                                                                                                                            userRefs: [stackPostRecord.postUser!],
                                                                                                                            initialPageName: 'chat_2_Details',
                                                                                                                            parameterData: {
                                                                                                                              'chatRef': _model.newChatucollect,
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
                                                                                                }
                                                                                              },
                                                                                            );
                                                                                          } else {
                                                                                            return Builder(
                                                                                              builder: (context) {
                                                                                                if (stackPostRecord.joinMember.contains(currentUserReference) && (stackPostRecord.postUser != currentUserReference)) {
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
                                                                                                      color: const Color(0x2157636C),
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'YuPearl',
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
                                                                                                  return Builder(
                                                                                                    builder: (context) {
                                                                                                      if (stackPostRecord.needApply || (stackPostRecord.hasNeedApply() == false)) {
                                                                                                        return FFButtonWidget(
                                                                                                          onPressed: ((stackPostRecord.postUser == currentUserReference) || !stackPostRecord.postStatus || stackPostRecord.joinMember.contains(currentUserReference))
                                                                                                              ? null
                                                                                                              : () async {
                                                                                                                  logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_申請_BTN_ON_TAP');
                                                                                                                  logFirebaseEvent('Button_navigate_to');

                                                                                                                  context.pushNamed(
                                                                                                                    'joinpage',
                                                                                                                    queryParameters: {
                                                                                                                      'postchosed': serializeParam(
                                                                                                                        stackPostRecord.reference,
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
                                                                                                      } else {
                                                                                                        return FFButtonWidget(
                                                                                                          onPressed: ((stackPostRecord.postUser == currentUserReference) || !stackPostRecord.postStatus || stackPostRecord.joinMember.contains(currentUserReference))
                                                                                                              ? null
                                                                                                              : () async {
                                                                                                                  logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_加入_BTN_ON_TAP');
                                                                                                                  if (stackPostRecord.chatOfPost != null) {
                                                                                                                    // updateChat
                                                                                                                    logFirebaseEvent('Button_updateChat');

                                                                                                                    await stackPostRecord.chatOfPost!.update({
                                                                                                                      ...mapToFirestore(
                                                                                                                        {
                                                                                                                          'users': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    });
                                                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                                                    await stackPostRecord.reference.update({
                                                                                                                      ...mapToFirestore(
                                                                                                                        {
                                                                                                                          'join_member': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    });
                                                                                                                    logFirebaseEvent('Button_custom_action');
                                                                                                                    _model.chatdocucollect2 = await actions.getDocReffromchat(
                                                                                                                      stackPostRecord.chatOfPost!,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Button_navigate_to');

                                                                                                                    context.goNamed(
                                                                                                                      'chat_2_Details',
                                                                                                                      queryParameters: {
                                                                                                                        'chatRef': serializeParam(
                                                                                                                          _model.chatdocucollect2,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        'chatRef': _model.chatdocucollect2,
                                                                                                                      },
                                                                                                                    );

                                                                                                                    logFirebaseEvent('Button_trigger_push_notification');
                                                                                                                    triggerPushNotification(
                                                                                                                      notificationTitle: 'Connextion ',
                                                                                                                      notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                      notificationSound: 'default',
                                                                                                                      userRefs: [stackPostRecord.postUser!],
                                                                                                                      initialPageName: 'chat_2_Details',
                                                                                                                      parameterData: {
                                                                                                                        'chatRef': _model.chatdocucollect2,
                                                                                                                      },
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    // newChat
                                                                                                                    logFirebaseEvent('Button_newChat');

                                                                                                                    var chatsRecordReference = ChatsRecord.collection.doc();
                                                                                                                    await chatsRecordReference.set({
                                                                                                                      ...createChatsRecordData(
                                                                                                                        userA: stackPostRecord.postUser,
                                                                                                                        userB: currentUserReference,
                                                                                                                        lastMessage: '',
                                                                                                                        lastMessageTime: getCurrentTimestamp,
                                                                                                                        groupChatId: stackPostRecord.chatOfPostID,
                                                                                                                        postOfChat: stackPostRecord.reference,
                                                                                                                        chatName: stackPostRecord.postChatName,
                                                                                                                      ),
                                                                                                                      ...mapToFirestore(
                                                                                                                        {
                                                                                                                          'users': [stackPostRecord.postUser],
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    });
                                                                                                                    _model.newChatucollect2 = ChatsRecord.getDocumentFromData({
                                                                                                                      ...createChatsRecordData(
                                                                                                                        userA: stackPostRecord.postUser,
                                                                                                                        userB: currentUserReference,
                                                                                                                        lastMessage: '',
                                                                                                                        lastMessageTime: getCurrentTimestamp,
                                                                                                                        groupChatId: stackPostRecord.chatOfPostID,
                                                                                                                        postOfChat: stackPostRecord.reference,
                                                                                                                        chatName: stackPostRecord.postChatName,
                                                                                                                      ),
                                                                                                                      ...mapToFirestore(
                                                                                                                        {
                                                                                                                          'users': [stackPostRecord.postUser],
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    }, chatsRecordReference);
                                                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                                                    await stackPostRecord.reference.update({
                                                                                                                      ...createPostRecordData(
                                                                                                                        chatOfPost: _model.newChatucollect2?.reference,
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
                                                                                                                          _model.newChatucollect2,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        'chatRef': _model.newChatucollect2,
                                                                                                                      },
                                                                                                                    );

                                                                                                                    logFirebaseEvent('Button_trigger_push_notification');
                                                                                                                    triggerPushNotification(
                                                                                                                      notificationTitle: 'Connextion ',
                                                                                                                      notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                      notificationSound: 'default',
                                                                                                                      userRefs: [stackPostRecord.postUser!],
                                                                                                                      initialPageName: 'chat_2_Details',
                                                                                                                      parameterData: {
                                                                                                                        'chatRef': _model.newChatucollect2,
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
                                                                                          }
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  return FFButtonWidget(
                                                                                    onPressed: (stackPostRecord.postStatus == false)
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
                                                                                () {
                                                                              print('Button pressed ...');
                                                                            },
                                                                            text:
                                                                                '分享',
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.near_me,
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
                                                                              logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_移除_BTN_ON_TAP');
                                                                              logFirebaseEvent('Button_backend_call');

                                                                              await currentUserReference!.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'love_post_collection': FieldValue.arrayRemove([
                                                                                      stackPostRecord.reference
                                                                                    ]),
                                                                                    'Post_collection': FieldValue.arrayRemove([
                                                                                      getPostWithTimeFirestoreData(
                                                                                        updatePostWithTimeStruct(
                                                                                          lovePostlistItem,
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        true,
                                                                                      )
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                            },
                                                                            text:
                                                                                '移除',
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.delete_forever,
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
                                  );
                                } else {
                                  return Builder(
                                    builder: (context) {
                                      final searchResult =
                                          _model.simpleSearchResults.toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: searchResult.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8.0),
                                        itemBuilder:
                                            (context, searchResultIndex) {
                                          final searchResultItem =
                                              searchResult[searchResultIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
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
                                                          'U_COLLECTION_POSTColumn_6e1bydqw_ON_TAP');
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
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0x13727D85),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord
                                                                  .getDocument(
                                                                      searchResultItem
                                                                          .postUser!),
                                                              builder: (context,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final rowUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (rowUsersRecord.photoUrl != '') {
                                                                            return Container(
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
                                                                              child: Icon(
                                                                                Icons.person,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 22.0,
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            53.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                                logFirebaseEvent('U_COLLECTION_POSTuser_name_ON_TAP');
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
                                                                      borderColor:
                                                                          const Color(
                                                                              0x00FFFFFF),
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      fillColor:
                                                                          const Color(
                                                                              0x00F7F7F7),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_control,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'U_COLLECTION_POSTkeyboard_control_ICN_ON');
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_page_state');
                                                                        _model.showSharebottom =
                                                                            true;
                                                                        _model.tempclickPost =
                                                                            searchResultItem.reference;
                                                                        setState(
                                                                            () {});
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
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    searchResultItem
                                                                        .postText,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'YuPearl',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        3.0,
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
                                                                if (searchResultItem
                                                                            .postPhoto !=
                                                                        '')
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (valueOrDefault<
                                                                            bool>(
                                                                          searchResultItem.postPhoto != '',
                                                                          true,
                                                                        )) {
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              searchResultItem.postPhoto,
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                if ((searchResultItem
                                                                            .limitPeopleNum !=
                                                                        0) &&
                                                                    (searchResultItem
                                                                            .limitPeopleNum !=
                                                                        null))
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .people_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
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
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
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
                                                                if (searchResultItem
                                                                            .postInfoMoney !=
                                                                        '')
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            5.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .attach_money_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
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
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
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
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
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
                                                                        builder:
                                                                            (context) {
                                                                          if (searchResultItem.postStatus ==
                                                                              true) {
                                                                            return StreamBuilder<List<InvAskListRecord>>(
                                                                              stream: FFAppState().invMemberSaftyMode(
                                                                                uniqueQueryKey: searchResultItem.reference.id,
                                                                                requestFn: () => queryInvAskListRecord(
                                                                                  parent: searchResultItem.reference,
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
                                                                                    if (conditionalBuilderInvAskListRecord != null) {
                                                                                      return Builder(
                                                                                        builder: (context) {
                                                                                          if (conditionalBuilderInvAskListRecord.invAskMember.contains(currentUserReference) == true) {
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
                                                                                                color: const Color(0x2157636C),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'YuPearl',
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
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
                                                                                                if (searchResultItem.joinMember.contains(currentUserReference) && (searchResultItem.postUser != currentUserReference)) {
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
                                                                                                      color: const Color(0x2157636C),
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'YuPearl',
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
                                                                                                  return Builder(
                                                                                                    builder: (context) {
                                                                                                      if (searchResultItem.needApply || (searchResultItem.hasNeedApply() == false)) {
                                                                                                        return FFButtonWidget(
                                                                                                          onPressed: ((searchResultItem.postUser == currentUserReference) || !searchResultItem.postStatus || searchResultItem.joinMember.contains(currentUserReference))
                                                                                                              ? null
                                                                                                              : () async {
                                                                                                                  logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_申請_BTN_ON_TAP');
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
                                                                                                      } else {
                                                                                                        return FFButtonWidget(
                                                                                                          onPressed: ((searchResultItem.postUser == currentUserReference) || !searchResultItem.postStatus || searchResultItem.joinMember.contains(currentUserReference))
                                                                                                              ? null
                                                                                                              : () async {
                                                                                                                  logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_加入_BTN_ON_TAP');
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
                                                                                                                    _model.chatdoc = await actions.getDocReffromchat(
                                                                                                                      searchResultItem.chatOfPost!,
                                                                                                                    );
                                                                                                                    logFirebaseEvent('Button_navigate_to');

                                                                                                                    context.goNamed(
                                                                                                                      'chat_2_Details',
                                                                                                                      queryParameters: {
                                                                                                                        'chatRef': serializeParam(
                                                                                                                          _model.chatdoc,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        'chatRef': _model.chatdoc,
                                                                                                                      },
                                                                                                                    );

                                                                                                                    logFirebaseEvent('Button_trigger_push_notification');
                                                                                                                    triggerPushNotification(
                                                                                                                      notificationTitle: 'Connextion ',
                                                                                                                      notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                      notificationSound: 'default',
                                                                                                                      userRefs: [searchResultItem.postUser!],
                                                                                                                      initialPageName: 'chat_2_Details',
                                                                                                                      parameterData: {
                                                                                                                        'chatRef': _model.chatdoc,
                                                                                                                      },
                                                                                                                    );
                                                                                                                  } else {
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
                                                                                                                          'users': [searchResultItem.postUser],
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    });
                                                                                                                    _model.newChat = ChatsRecord.getDocumentFromData({
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
                                                                                                                          'users': [searchResultItem.postUser],
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    }, chatsRecordReference);
                                                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                                                    await searchResultItem.reference.update({
                                                                                                                      ...createPostRecordData(
                                                                                                                        chatOfPost: _model.newChat?.reference,
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
                                                                                                                          _model.newChat,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        'chatRef': _model.newChat,
                                                                                                                      },
                                                                                                                    );

                                                                                                                    logFirebaseEvent('Button_trigger_push_notification');
                                                                                                                    triggerPushNotification(
                                                                                                                      notificationTitle: 'Connextion ',
                                                                                                                      notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                      notificationSound: 'default',
                                                                                                                      userRefs: [searchResultItem.postUser!],
                                                                                                                      initialPageName: 'chat_2_Details',
                                                                                                                      parameterData: {
                                                                                                                        'chatRef': _model.newChat,
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
                                                                                          }
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      return Builder(
                                                                                        builder: (context) {
                                                                                          if (searchResultItem.joinMember.contains(currentUserReference) && (searchResultItem.postUser != currentUserReference)) {
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
                                                                                                color: const Color(0x2157636C),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'YuPearl',
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                                elevation: 3.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                              ),
                                                                                            );
                                                                                          } else {
                                                                                            return Builder(
                                                                                              builder: (context) {
                                                                                                if (searchResultItem.needApply || (searchResultItem.hasNeedApply() == false)) {
                                                                                                  return FFButtonWidget(
                                                                                                    onPressed: ((searchResultItem.postUser == currentUserReference) || !searchResultItem.postStatus || searchResultItem.joinMember.contains(currentUserReference))
                                                                                                        ? null
                                                                                                        : () async {
                                                                                                            logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_申請_BTN_ON_TAP');
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
                                                                                                } else {
                                                                                                  return FFButtonWidget(
                                                                                                    onPressed: ((searchResultItem.postUser == currentUserReference) || !searchResultItem.postStatus || searchResultItem.joinMember.contains(currentUserReference))
                                                                                                        ? null
                                                                                                        : () async {
                                                                                                            logFirebaseEvent('U_COLLECTION_POSTPAGE_PAGE_加入_BTN_ON_TAP');
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
                                                                                                              _model.chatdocucollectSearch = await actions.getDocReffromchat(
                                                                                                                searchResultItem.chatOfPost!,
                                                                                                              );
                                                                                                              logFirebaseEvent('Button_navigate_to');

                                                                                                              context.goNamed(
                                                                                                                'chat_2_Details',
                                                                                                                queryParameters: {
                                                                                                                  'chatRef': serializeParam(
                                                                                                                    _model.chatdocucollectSearch,
                                                                                                                    ParamType.Document,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                                extra: <String, dynamic>{
                                                                                                                  'chatRef': _model.chatdocucollectSearch,
                                                                                                                },
                                                                                                              );

                                                                                                              logFirebaseEvent('Button_trigger_push_notification');
                                                                                                              triggerPushNotification(
                                                                                                                notificationTitle: 'Connextion ',
                                                                                                                notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                notificationSound: 'default',
                                                                                                                userRefs: [searchResultItem.postUser!],
                                                                                                                initialPageName: 'chat_2_Details',
                                                                                                                parameterData: {
                                                                                                                  'chatRef': _model.chatdocucollectSearch,
                                                                                                                },
                                                                                                              );
                                                                                                            } else {
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
                                                                                                                    'users': [searchResultItem.postUser],
                                                                                                                  },
                                                                                                                ),
                                                                                                              });
                                                                                                              _model.newChatucollectSearch = ChatsRecord.getDocumentFromData({
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
                                                                                                                    'users': [searchResultItem.postUser],
                                                                                                                  },
                                                                                                                ),
                                                                                                              }, chatsRecordReference);
                                                                                                              logFirebaseEvent('Button_backend_call');

                                                                                                              await searchResultItem.reference.update({
                                                                                                                ...createPostRecordData(
                                                                                                                  chatOfPost: _model.newChatucollectSearch?.reference,
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
                                                                                                                    _model.newChatucollectSearch,
                                                                                                                    ParamType.Document,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                                extra: <String, dynamic>{
                                                                                                                  'chatRef': _model.newChatucollectSearch,
                                                                                                                },
                                                                                                              );

                                                                                                              logFirebaseEvent('Button_trigger_push_notification');
                                                                                                              triggerPushNotification(
                                                                                                                notificationTitle: 'Connextion ',
                                                                                                                notificationText: '$currentUserDisplayName  已加入您的貼文聊天室',
                                                                                                                notificationSound: 'default',
                                                                                                                userRefs: [searchResultItem.postUser!],
                                                                                                                initialPageName: 'chat_2_Details',
                                                                                                                parameterData: {
                                                                                                                  'chatRef': _model.newChatucollectSearch,
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
                                                                                    }
                                                                                  },
                                                                                );
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
                                                            opacity: 0.7,
                                                            child: Divider(
                                                              thickness: 1.0,
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
                                                    (searchResultItem
                                                            .reference ==
                                                        _model.tempclickPost))
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
                                                        width: 100.0,
                                                        height: 88.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x9B9E9D9D),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    50.0),
                                                            topRight:
                                                                Radius.circular(
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
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'Button pressed ...');
                                                                      },
                                                                      text:
                                                                          '分享',
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .near_me,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
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
                                                                ),
                                                              ),
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
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'U_COLLECTION_POSTPAGE_PAGE_移除_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'love_post_collection': FieldValue.arrayRemove([
                                                                                searchResultItem.reference
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_custom_action');
                                                                        _model.postNewCollection =
                                                                            await actions.removedatetype(
                                                                          (currentUserDocument?.postCollection.toList() ?? [])
                                                                              .toList(),
                                                                          searchResultItem
                                                                              .reference,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'Post_collection': getPostWithTimeListFirestoreData(
                                                                                _model.postNewCollection,
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_clear_text_fields_pin_codes');
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textController
                                                                              ?.clear();
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.showSearchaction =
                                                                            false;
                                                                        setState(
                                                                            () {});

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          '移除',
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .delete_forever,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'YuPearl',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 1.0,
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
                                          );
                                        },
                                      );
                                    },
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
