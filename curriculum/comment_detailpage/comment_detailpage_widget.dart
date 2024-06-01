import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'comment_detailpage_model.dart';
export 'comment_detailpage_model.dart';

class CommentDetailpageWidget extends StatefulWidget {
  const CommentDetailpageWidget({
    super.key,
    required this.courseref,
    required this.chillavg,
    required this.hardavg,
    required this.userComment,
    required this.numComment,
  });

  final DocumentReference? courseref;
  final double? chillavg;
  final double? hardavg;
  final CommentRecord? userComment;
  final int? numComment;

  @override
  State<CommentDetailpageWidget> createState() =>
      _CommentDetailpageWidgetState();
}

class _CommentDetailpageWidgetState extends State<CommentDetailpageWidget>
    with TickerProviderStateMixin {
  late CommentDetailpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentDetailpageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'commentDetailpage'});
    _model.textController ??=
        TextEditingController(text: widget.userComment?.content);
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-100.0, 0.0),
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

    return StreamBuilder<NthuCoursesRecord>(
      stream: NthuCoursesRecord.getDocument(widget.courseref!),
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
        final commentDetailpageNthuCoursesRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).info,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 50.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
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
                                        'COMMENT_DETAILchevron_left_sharp_ICN_ON_');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.safePop();
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().showcourseDetail = true;
                                    FFAppState().update(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (FFAppState().showcourseDetail)
                          Container(
                            width: double.infinity,
                            height: _model.showdetail ? 320.0 : 290.0,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          commentDetailpageNthuCoursesRecord
                                              .chineseName
                                              .maybeHandleOverflow(
                                                  maxChars: 15),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'YuPearl',
                                                fontSize: 25.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'COMMENT_DETAILIcon_up7xmgf9_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_update_page_state');
                                            _model.showdetail =
                                                !_model.showdetail;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.info_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (commentDetailpageNthuCoursesRecord
                                                    .photoOfCourse !=
                                                '') {
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  15.0,
                                                                  16.0,
                                                                  10.0),
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
                                                              'COMMENT_DETAILImage_cxnobjto_ON_TAP');
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
                                                                image: Image
                                                                    .network(
                                                                  commentDetailpageNthuCoursesRecord
                                                                      .photoOfCourse,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag: commentDetailpageNthuCoursesRecord
                                                                    .photoOfCourse,
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: commentDetailpageNthuCoursesRecord
                                                              .photoOfCourse,
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              commentDetailpageNthuCoursesRecord
                                                                  .photoOfCourse,
                                                              width: 120.0,
                                                              height: 120.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Container(
                                                      width: 120.0,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.close_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 50.0,
                                                          ),
                                                          Text(
                                                            '尚未有課程圖片',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
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
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 50.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0x1542BAF1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                '涼度:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star_rounded,
                                                color: Color(0xFFF49269),
                                              ),
                                              direction: Axis.horizontal,
                                              rating: valueOrDefault<double>(
                                                widget.chillavg,
                                                0.0,
                                              ),
                                              unratedColor: const Color(0x22EE8B60),
                                              itemCount: 5,
                                              itemSize: 21.0,
                                            ),
                                            const SizedBox(
                                              height: 16.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color: Color(0x8014181B),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                '難度:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star_rounded,
                                                color: Color(0xFFF49269),
                                              ),
                                              direction: Axis.horizontal,
                                              rating: valueOrDefault<double>(
                                                widget.hardavg,
                                                0.0,
                                              ),
                                              unratedColor: const Color(0x22EE8B60),
                                              itemCount: 5,
                                              itemSize: 21.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  widget.numComment?.toString(),
                                                  '0',
                                                )} 人已評論',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.showdetail)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 10.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '課程代碼＆時間:  ${commentDetailpageNthuCoursesRecord.number}  ${commentDetailpageNthuCoursesRecord.timeString}',
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'YuPearl',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '教室＆授課教授: ${commentDetailpageNthuCoursesRecord.classroom}  ${commentDetailpageNthuCoursesRecord.teacher}',
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'YuPearl',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation']!),
                                      ),
                                      const Divider(
                                        thickness: 1.0,
                                        indent: 30.0,
                                        endIndent: 30.0,
                                        color: Color(0x2914181B),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                      child: Container(
                        height: 360.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 3.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '您的評分:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'YuPearl',
                                                  fontSize: 15.0,
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
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ' 涼度:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'YuPearl',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  11.0, 0.0, 4.0, 0.0),
                                          child: RatingBar.builder(
                                            onRatingUpdate: (newValue) =>
                                                setState(() =>
                                                    _model.chillinteractValue =
                                                        newValue),
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFF49269),
                                            ),
                                            direction: Axis.horizontal,
                                            initialRating: _model
                                                    .chillinteractValue ??=
                                                (widget.userComment != null) &&
                                                        (widget.userComment
                                                                ?.chillScore !=
                                                            null)
                                                    ? widget
                                                        .userComment!.chillScore
                                                    : 0.0,
                                            unratedColor: const Color(0x22EE8B60),
                                            itemCount: 5,
                                            itemSize: 24.0,
                                            glowColor: const Color(0xFFF49269),
                                          ),
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
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          '難度:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'YuPearl',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) => setState(
                                            () => _model.hardinteractValue =
                                                newValue),
                                        itemBuilder: (context, index) => const Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFF49269),
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: _model
                                                .hardinteractValue ??=
                                            (widget.userComment != null) &&
                                                    (widget.userComment
                                                            ?.hardScore !=
                                                        null)
                                                ? widget.userComment!.hardScore
                                                : 0.0,
                                        unratedColor: const Color(0x22EE8B60),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        glowColor: const Color(0xFFF49269),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0x2C14181B),
                                    ),
                                  ],
                                ),
                              ),
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController',
                                                  const Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: '留下你的匿名課堂評論....',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 8.0,
                                                              16.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                textAlign: TextAlign.start,
                                                maxLines: 10,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: const Icon(
                                                      Icons.near_me_rounded,
                                                      color: Color(0xFF42BAF1),
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'COMMENT_DETAILnear_me_rounded_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_validate_form');
                                                      if (_model.formKey
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      logFirebaseEvent(
                                                          'IconButton_backend_call');

                                                      var commentRecordReference =
                                                          CommentRecord
                                                              .collection
                                                              .doc();
                                                      await commentRecordReference
                                                          .set(
                                                              createCommentRecordData(
                                                        content: _model
                                                            .textController
                                                            .text,
                                                        user:
                                                            currentUserReference,
                                                        course:
                                                            widget.courseref,
                                                        commentTime:
                                                            getCurrentTimestamp,
                                                        hardScore: _model
                                                            .hardinteractValue,
                                                        chillScore: _model
                                                            .chillinteractValue,
                                                      ));
                                                      _model.newCommentWithScore =
                                                          CommentRecord
                                                              .getDocumentFromData(
                                                                  createCommentRecordData(
                                                                    content: _model
                                                                        .textController
                                                                        .text,
                                                                    user:
                                                                        currentUserReference,
                                                                    course: widget
                                                                        .courseref,
                                                                    commentTime:
                                                                        getCurrentTimestamp,
                                                                    hardScore:
                                                                        _model
                                                                            .hardinteractValue,
                                                                    chillScore:
                                                                        _model
                                                                            .chillinteractValue,
                                                                  ),
                                                                  commentRecordReference);
                                                      if (widget.userComment !=
                                                          null) {
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        _model.allCommentWithOrder =
                                                            await actions
                                                                .commentChangeOrder(
                                                          commentDetailpageNthuCoursesRecord
                                                              .allComment
                                                              .toList(),
                                                          _model
                                                              .newCommentWithScore
                                                              ?.reference,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await widget.courseref!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'All_comment': _model
                                                                  .allCommentWithOrder,
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await widget.courseref!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'All_comment':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                widget
                                                                    .userComment
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'comment_with_user':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                widget
                                                                    .userComment
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        await widget
                                                            .userComment!
                                                            .reference
                                                            .delete();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'IconButton_custom_action');
                                                        _model.allCommentWithOrderNew =
                                                            await actions
                                                                .commentChangeOrder(
                                                          commentDetailpageNthuCoursesRecord
                                                              .allComment
                                                              .toList(),
                                                          _model
                                                              .newCommentWithScore
                                                              ?.reference,
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await widget.courseref!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'All_comment': _model
                                                                  .allCommentWithOrderNew,
                                                            },
                                                          ),
                                                        });
                                                      }

                                                      logFirebaseEvent(
                                                          'IconButton_backend_call');

                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'comment_with_user':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model
                                                                  .newCommentWithScore
                                                                  ?.reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'IconButton_clear_text_fields_pin_codes');
                                                      setState(() {
                                                        _model.textController
                                                            ?.clear();
                                                      });
                                                      logFirebaseEvent(
                                                          'IconButton_firestore_query');
                                                      _model.userincourse =
                                                          await queryUsersRecordOnce(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'user_curriculum2',
                                                          arrayContains:
                                                              widget.courseref,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'IconButton_navigate_to');

                                                      context.pushNamed(
                                                        'classdetailpage',
                                                        queryParameters: {
                                                          'course':
                                                              serializeParam(
                                                            widget.courseref,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      logFirebaseEvent(
                                                          'IconButton_trigger_push_notification');
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'Connextion',
                                                        notificationText:
                                                            '${commentDetailpageNthuCoursesRecord.chineseName} 有一則新的匿名評論',
                                                        userRefs: _model
                                                            .userincourse!
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                        initialPageName:
                                                            'classdetailpage',
                                                        parameterData: {
                                                          'course':
                                                              widget.courseref,
                                                        },
                                                      );

                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
