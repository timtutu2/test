import '/app_version_check/appcheck/appcheck_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/curriculum/selectcourses/selectcourses_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/privacy_and_e_u_l_a/eula/eula_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'timeplanner_model.dart';
export 'timeplanner_model.dart';

class TimeplannerWidget extends StatefulWidget {
  const TimeplannerWidget({super.key});

  @override
  State<TimeplannerWidget> createState() => _TimeplannerWidgetState();
}

class _TimeplannerWidgetState extends State<TimeplannerWidget>
    with TickerProviderStateMixin {
  late TimeplannerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeplannerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'timeplanner'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TIMEPLANNER_timeplanner_ON_INIT_STATE');
      if (!FFAppState().EULAgreementApp) {
        logFirebaseEvent('timeplanner_bottom_sheet');
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

        logFirebaseEvent('timeplanner_google_analytics_event');
        logFirebaseEvent(
          'navBar_click',
          parameters: {
            'nav_bar': 'course',
          },
        );
      }
      logFirebaseEvent('timeplanner_firestore_query');
      _model.userCoursesRef = await queryCourseCurriculumRecordOnce(
        queryBuilder: (courseCurriculumRecord) => courseCurriculumRecord.where(
          'user_ref',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.userCoursesRef != null) {
        logFirebaseEvent('timeplanner_update_app_state');
        FFAppState().coursecurriculumRef = _model.userCoursesRef?.reference;
        logFirebaseEvent('timeplanner_update_app_state');
        FFAppState().courseDayTime =
            _model.userCoursesRef!.courseDayTime.toList().cast<String>();
        logFirebaseEvent('timeplanner_update_app_state');
        FFAppState().chooseCourseRef =
            _model.userCoursesRef!.courseRef.toList().cast<DocumentReference>();
        logFirebaseEvent('timeplanner_custom_action');
        _model.coursedocs = await actions.covertDocRefsToDocs(
          FFAppState().chooseCourseRef.toList(),
        );
        logFirebaseEvent('timeplanner_update_page_state');
        _model.courseDocs =
            _model.coursedocs!.toList().cast<NthuCoursesRecord>();
        setState(() {});
        logFirebaseEvent('timeplanner_update_page_state');
        _model.customColor = _model.userCoursesRef!.customColor
            .toList()
            .cast<CustomColorStruct>();
        setState(() {});
      } else {
        logFirebaseEvent('timeplanner_backend_call');

        var courseCurriculumRecordReference =
            CourseCurriculumRecord.collection.doc();
        await courseCurriculumRecordReference.set({
          ...createCourseCurriculumRecordData(
            userRef: currentUserReference,
          ),
          ...mapToFirestore(
            {
              'curr_index': FFAppState().currindex,
            },
          ),
        });
        _model.newCir = CourseCurriculumRecord.getDocumentFromData({
          ...createCourseCurriculumRecordData(
            userRef: currentUserReference,
          ),
          ...mapToFirestore(
            {
              'curr_index': FFAppState().currindex,
            },
          ),
        }, courseCurriculumRecordReference);
        logFirebaseEvent('timeplanner_update_app_state');
        FFAppState().coursecurriculumRef = _model.newCir?.reference;
      }

      logFirebaseEvent('timeplanner_custom_action');
      _model.versionGet = await actions.versioncheck();
      logFirebaseEvent('timeplanner_firestore_query');
      _model.versionLastest = await queryVersionCheckRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('timeplanner_update_app_state');
      FFAppState().ApplastestVersion = FFAppState().ApplastestVersion;
      if (valueOrDefault(currentUserDocument?.school, '') != '') {
        if (_model.versionGet != FFAppState().ApplastestVersion) {
          logFirebaseEvent('timeplanner_bottom_sheet');
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
        logFirebaseEvent('timeplanner_custom_action');
        unawaited(
          () async {
            await actions.fixpageNorotate();
          }(),
        );
      } else {
        logFirebaseEvent('timeplanner_update_page_state');
        _model.schoolchosed = false;
        setState(() {});
        logFirebaseEvent('timeplanner_custom_action');
        unawaited(
          () async {
            await actions.fixpageNorotate();
          }(),
        );
      }
    });

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.tabBarController2 = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
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
              if (valueOrDefault(currentUserDocument?.school, '') == '國立清華大學')
                AuthUserStreamWidget(
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'YuPearl',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                unselectedLabelStyle: const TextStyle(),
                                indicatorColor: const Color(0xFF42BAF1),
                                padding: const EdgeInsets.all(4.0),
                                tabs: const [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                      ),
                                      Tab(
                                        text: '  課表',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_rounded,
                                      ),
                                      Tab(
                                        text: '待辦清單',
                                      ),
                                    ],
                                  ),
                                ],
                                controller: _model.tabBarController1,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController1,
                                children: [
                                  ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: Stack(
                                          alignment:
                                              const AlignmentDirectional(1.0, -1.0),
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      22.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    (MediaQuery.sizeOf(context)
                                                                .width -
                                                            80) *
                                                        7 /
                                                        6,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: FlutterFlowCalendar(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  iconColor: Colors.white,
                                                  weekFormat: true,
                                                  weekStartsMonday: false,
                                                  rowHeight: 32.0,
                                                  onChange: (DateTimeRange?
                                                      newSelectedDate) {
                                                    setState(() => _model
                                                            .calendarSelectedDay1 =
                                                        newSelectedDate);
                                                  },
                                                  titleStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  dayOfWeekStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'YuPearl',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.0,
                                                          ),
                                                  dateStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  selectedDateStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'YuPearl',
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                  inactiveDateStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'YuPearl',
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 5.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        const Color(0x9757636C),
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.restart_alt_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'TIMEPLANNER_restart_alt_rounded_ICN_ON_T');
                                                      logFirebaseEvent(
                                                          'IconButton_alert_dialog');
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        '重置課表'),
                                                                    content: const Text(
                                                                        '確定要重置課表嗎?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: const Text(
                                                                            '取消'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: const Text(
                                                                            '確認'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        await FFAppState()
                                                            .coursecurriculumRef!
                                                            .delete();
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'user_curriculum2':
                                                                  FieldValue
                                                                      .delete(),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState()
                                                                .coursecurriculumRef =
                                                            FirebaseFirestore
                                                                .instance
                                                                .doc(
                                                                    '/course_curriculum/default');
                                                        FFAppState()
                                                            .courseDayTime = [];
                                                        FFAppState()
                                                            .chooseCourseRef = [];
                                                        logFirebaseEvent(
                                                            'IconButton_update_page_state');
                                                        _model.courseDocs = [];
                                                        setState(() {});
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 40.0, 5.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        const Color(0xFF42BAF1),
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'TIMEPLANNER_PAGE_add_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_firestore_query');
                                                      _model.exist =
                                                          await queryCourseCurriculumRecordOnce(
                                                        queryBuilder:
                                                            (courseCurriculumRecord) =>
                                                                courseCurriculumRecord
                                                                    .where(
                                                          'user_ref',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      logFirebaseEvent(
                                                          'IconButton_firestore_query');
                                                      _model.outputNTHUcourseindex =
                                                          await queryCourseIndexListRecordOnce(
                                                        queryBuilder:
                                                            (courseIndexListRecord) =>
                                                                courseIndexListRecord
                                                                    .where(
                                                          'index',
                                                          isEqualTo: 1,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (_model.exist !=
                                                          null) {
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState().currindex =
                                                            _model
                                                                .outputNTHUcourseindex!
                                                                .courseIndex
                                                                .toList()
                                                                .cast<String>();
                                                        setState(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState().currindex =
                                                            _model
                                                                .outputNTHUcourseindex!
                                                                .courseIndex
                                                                .toList()
                                                                .cast<String>();
                                                        setState(() {});
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        var courseCurriculumRecordReference =
                                                            CourseCurriculumRecord
                                                                .collection
                                                                .doc();
                                                        await courseCurriculumRecordReference
                                                            .set({
                                                          ...createCourseCurriculumRecordData(
                                                            userRef:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'curr_index':
                                                                  FFAppState()
                                                                      .currindex,
                                                            },
                                                          ),
                                                        });
                                                        _model.newCirbuttom =
                                                            CourseCurriculumRecord
                                                                .getDocumentFromData({
                                                          ...createCourseCurriculumRecordData(
                                                            userRef:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'curr_index':
                                                                  FFAppState()
                                                                      .currindex,
                                                            },
                                                          ),
                                                        }, courseCurriculumRecordReference);
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState()
                                                                .coursecurriculumRef =
                                                            _model.newCirbuttom
                                                                ?.reference;
                                                      }

                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: const SizedBox(
                                                                height: 700.0,
                                                                child:
                                                                    SelectcoursesWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.bottomreturn =
                                                                  value));

                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 580.0,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 75.0,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '1',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '08:00\n08:50',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '2',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '09:00\n09:50',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '3',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '10:10\n11:00',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '4',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '11:10\n12:00',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'n',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '12:10\n13:00',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '5',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '13:20\n14:10',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '6',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '14:20\n15:10',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '7',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '15:30\n16:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '8',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '16:30\n17:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '9',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '17:30\n18:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'a',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '18:30\n19:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'b',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '19:30\n20:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'c',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '20:30\n21:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
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
                                            Flexible(
                                              child: StreamBuilder<
                                                  List<CourseCurriculumRecord>>(
                                                stream:
                                                    queryCourseCurriculumRecord(
                                                  queryBuilder:
                                                      (courseCurriculumRecord) =>
                                                          courseCurriculumRecord
                                                              .where(
                                                    'user_ref',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CourseCurriculumRecord>
                                                      containerCourseCurriculumRecordList =
                                                      snapshot.data!;
                                                  final containerCourseCurriculumRecord =
                                                      containerCourseCurriculumRecordList
                                                              .isNotEmpty
                                                          ? containerCourseCurriculumRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final curri =
                                                            containerCourseCurriculumRecord
                                                                    ?.currIndex
                                                                    .map((e) =>
                                                                        e)
                                                                    .toList()
                                                                    .toList() ??
                                                                [];
                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 6,
                                                            crossAxisSpacing:
                                                                4.0,
                                                            childAspectRatio: functions
                                                                .calenderWidthchange(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width),
                                                          ),
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              curri.length,
                                                          itemBuilder: (context,
                                                              curriIndex) {
                                                            final curriItem =
                                                                curri[
                                                                    curriIndex];
                                                            return InkWell(
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
                                                                    'TIMEPLANNER_Container_j08us825_ON_TAP');
                                                                if (functions
                                                                        .finditemInDocs(
                                                                            (_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(),
                                                                            curriItem)
                                                                        ?.reference !=
                                                                    null) {
                                                                  logFirebaseEvent(
                                                                      'Container_custom_action');
                                                                  _model.outputcolor =
                                                                      await actions
                                                                          .flutterColorpac(
                                                                    context,
                                                                    colorFromCssString(
                                                                      functions.findCoursecustomColor(functions.finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)?.reference, containerCourseCurriculumRecord.customColor.toList()) !=
                                                                              'default'
                                                                          ? functions.findCoursecustomColor(
                                                                              functions.finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)?.reference,
                                                                              containerCourseCurriculumRecord.customColor.toList())
                                                                          : valueOrDefault<String>(
                                                                              functions.finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)?.color,
                                                                              '#FFFFFF',
                                                                            ),
                                                                      defaultColor:
                                                                          Colors
                                                                              .white,
                                                                    ),
                                                                  );
                                                                  if (_model
                                                                          .outputcolor !=
                                                                      null) {
                                                                    logFirebaseEvent(
                                                                        'Container_custom_action');
                                                                    _model.outputcustomcolor =
                                                                        await actions
                                                                            .getCustomColorspecificoption(
                                                                      containerCourseCurriculumRecord
                                                                          .customColor
                                                                          .toList(),
                                                                      functions
                                                                          .finditemInDocs(
                                                                              (_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(),
                                                                              curriItem)!
                                                                          .reference,
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Container_custom_action');
                                                                    _model.changedoc =
                                                                        await actions
                                                                            .finditemiDocsaction(
                                                                      (_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty
                                                                              ? _model.bottomreturn
                                                                              : _model.courseDocs)
                                                                          ?.toList(),
                                                                      curriItem,
                                                                    );
                                                                    if (_model
                                                                            .outputcustomcolor ==
                                                                        null) {
                                                                      logFirebaseEvent(
                                                                          'Container_custom_action');
                                                                      _model.colorOutput1 =
                                                                          await actions
                                                                              .turnColortoString(
                                                                        _model
                                                                            .outputcolor!,
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await containerCourseCurriculumRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'custom_color':
                                                                                FieldValue.arrayUnion([
                                                                              getCustomColorFirestoreData(
                                                                                updateCustomColorStruct(
                                                                                  CustomColorStruct(
                                                                                    choseCourse: _model.changedoc?.reference,
                                                                                    color: _model.colorOutput1,
                                                                                  ),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.customColor = containerCourseCurriculumRecord
                                                                          .customColor
                                                                          .toList()
                                                                          .cast<
                                                                              CustomColorStruct>();
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await containerCourseCurriculumRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'custom_color':
                                                                                FieldValue.arrayRemove([
                                                                              getCustomColorFirestoreData(
                                                                                updateCustomColorStruct(
                                                                                  _model.outputcustomcolor,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_custom_action');
                                                                      _model.colorOutput2 =
                                                                          await actions
                                                                              .turnColortoString(
                                                                        _model
                                                                            .outputcolor!,
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await containerCourseCurriculumRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'custom_color':
                                                                                FieldValue.arrayUnion([
                                                                              getCustomColorFirestoreData(
                                                                                updateCustomColorStruct(
                                                                                  CustomColorStruct(
                                                                                    choseCourse: _model.changedoc?.reference,
                                                                                    color: _model.colorOutput2,
                                                                                  ),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.customColor = containerCourseCurriculumRecord
                                                                          .customColor
                                                                          .toList()
                                                                          .cast<
                                                                              CustomColorStruct>();
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_update_page_state');
                                                                    _model.customColor = containerCourseCurriculumRecord
                                                                        .customColor
                                                                        .toList()
                                                                        .cast<
                                                                            CustomColorStruct>();
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.customColor = containerCourseCurriculumRecord
                                                                      .customColor
                                                                      .toList()
                                                                      .cast<
                                                                          CustomColorStruct>();
                                                                  setState(
                                                                      () {});
                                                                }

                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                width: 44.0,
                                                                height: 44.0,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  minWidth:
                                                                      44.0,
                                                                  minHeight:
                                                                      44.0,
                                                                  maxWidth:
                                                                      44.0,
                                                                  maxHeight:
                                                                      44.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      colorFromCssString(
                                                                    functions.findCoursecustomColor(functions.finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)?.reference, containerCourseCurriculumRecord!.customColor.toList()) !=
                                                                            'default'
                                                                        ? functions.findCoursecustomColor(
                                                                            functions.finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)?.reference,
                                                                            containerCourseCurriculumRecord.customColor.toList())
                                                                        : valueOrDefault<String>(
                                                                            functions.finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)?.color,
                                                                            '#FFFFFF',
                                                                          ),
                                                                    defaultColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          1.0,
                                                                          2.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)
                                                                              ?.chineseName,
                                                                          '無課程資訊',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              6,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const Spacer(),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          1.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .finditemInDocs((_model.bottomreturn != null && (_model.bottomreturn)!.isNotEmpty ? _model.bottomreturn : _model.courseDocs)?.toList(), curriItem)
                                                                              ?.classroom,
                                                                          '無教室名稱',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              6,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontSize:
                                                                              7.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 30.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor: const Color(0xFF42BAF1),
                                                icon: Icon(
                                                  Icons.add_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'TIMEPLANNER_PAGE_add_rounded_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_update_page_state');
                                                  _model.addTaskMode =
                                                      !_model.addTaskMode;
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<TasksRecord>>(
                                                stream: _model.todolist(
                                                  requestFn: () =>
                                                      queryTasksRecord(
                                                    queryBuilder:
                                                        (tasksRecord) =>
                                                            tasksRecord
                                                                .where(
                                                                  'user',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                )
                                                                .orderBy(
                                                                    'created',
                                                                    descending:
                                                                        true),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TasksRecord>
                                                      listViewTasksRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewTasksRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewTasksRecord =
                                                          listViewTasksRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    8.0),
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
                                                                'TIMEPLANNER_PAGE_menuItem_ON_TAP');
                                                            logFirebaseEvent(
                                                                'menuItem_navigate_to');

                                                            context.pushNamed(
                                                              'DetailPage',
                                                              queryParameters: {
                                                                'taskDoc':
                                                                    serializeParam(
                                                                  listViewTasksRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'taskDoc':
                                                                    listViewTasksRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x411D2429),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    1.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listViewTasksRecord.title,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: const Color(0xFF0F1113),
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              listViewTasksRecord.details.maybeHandleOverflow(
                                                                                maxChars: 70,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    color: const Color(0xFF57636C),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                            logFirebaseEvent('TIMEPLANNER_PAGE_Icon_dxop4a8g_ON_TAP');
                                                                            logFirebaseEvent('Icon_alert_dialog');
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: const Text('移除任務'),
                                                                                      content: const Text('確定要移除任務？'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                          child: const Text('取消'),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                          child: const Text('移除'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              logFirebaseEvent('Icon_backend_call');
                                                                              await listViewTasksRecord.reference.delete();
                                                                            }
                                                                          },
                                                                          child:
                                                                              const Icon(
                                                                            Icons.delete_rounded,
                                                                            color:
                                                                                Color(0x7657636C),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                      if (_model.addTaskMode == true)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
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
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(32.0),
                                                topRight: Radius.circular(32.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(24.0),
                                              child: ListView(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowIconButton(
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
                                                          icon: Icon(
                                                            Icons.close_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'TIMEPLANNER_close_rounded_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_update_page_state');
                                                            _model.addTaskMode =
                                                                false;
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '添加任務',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'YuPearl',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Form(
                                                    key: _model.formKey1,
                                                    autovalidateMode:
                                                        AutovalidateMode.always,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                              .textController1,
                                                          focusNode: _model
                                                              .textFieldFocusNode1,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController1',
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                            () =>
                                                                setState(() {}),
                                                          ),
                                                          autofocus: false,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .sentences,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
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
                                                            hintText: '主題',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
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
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'YuPearl',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          maxLines: null,
                                                          minLines: 1,
                                                          validator: _model
                                                              .textController1Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .textController2,
                                                          focusNode: _model
                                                              .textFieldFocusNode2,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController2',
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                            () =>
                                                                setState(() {}),
                                                          ),
                                                          autofocus: false,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .sentences,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'YuPearl',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            hintText: '任務內容...',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'YuPearl',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'YuPearl',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          maxLines: null,
                                                          minLines: 1,
                                                          validator: _model
                                                              .textController2Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: ((_model.textController1.text ==
                                                                              '') ||
                                                                      (_model.textController2.text ==
                                                                              '')
                                                                  ? true
                                                                  : false)
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'TIMEPLANNER_PAGE_添加任務_BTN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');

                                                                  await TasksRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createTasksRecordData(
                                                                        title: _model
                                                                            .textController1
                                                                            .text,
                                                                        details: _model
                                                                            .textController2
                                                                            .text,
                                                                        completed:
                                                                            false,
                                                                        user:
                                                                            currentUserReference,
                                                                        created:
                                                                            getCurrentTimestamp,
                                                                      ));
                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.addTaskMode =
                                                                      false;
                                                                  setState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_clear_text_fields_pin_codes');
                                                                  setState(() {
                                                                    _model
                                                                        .textController1
                                                                        ?.clear();
                                                                    _model
                                                                        .textController2
                                                                        ?.clear();
                                                                  });
                                                                },
                                                          text: '添加任務',
                                                          icon: const Icon(
                                                            Icons.add,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 250.0,
                                                            height: 50.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: const Color(
                                                                0xFF42BAF1),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'YuPearl',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                            disabledColor:
                                                                const Color(
                                                                    0xFFDBDCDE),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
              if ((valueOrDefault(currentUserDocument?.school, '') ==
                      '國立陽明交通大學') &&
                  (_model.schoolchosed == true))
                AuthUserStreamWidget(
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'YuPearl',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                unselectedLabelStyle: const TextStyle(),
                                indicatorColor: const Color(0xFF42BAF1),
                                padding: const EdgeInsets.all(4.0),
                                tabs: const [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                      ),
                                      Tab(
                                        text: '  課表',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_rounded,
                                      ),
                                      Tab(
                                        text: '待辦清單',
                                      ),
                                    ],
                                  ),
                                ],
                                controller: _model.tabBarController2,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController2,
                                children: [
                                  ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: Stack(
                                          alignment:
                                              const AlignmentDirectional(1.0, -1.0),
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      22.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    (MediaQuery.sizeOf(context)
                                                                .width -
                                                            80) *
                                                        7 /
                                                        6,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          43.0, 0.0, 0.0, 0.0),
                                                  child: FlutterFlowCalendar(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    iconColor: Colors.white,
                                                    weekFormat: true,
                                                    weekStartsMonday: false,
                                                    rowHeight: 32.0,
                                                    onChange: (DateTimeRange?
                                                        newSelectedDate) {
                                                      setState(() => _model
                                                              .calendarSelectedDay2 =
                                                          newSelectedDate);
                                                    },
                                                    titleStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    dayOfWeekStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'YuPearl',
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.0,
                                                            ),
                                                    dateStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'YuPearl',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    selectedDateStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  'YuPearl',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                    inactiveDateStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'YuPearl',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 5.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        const Color(0x9757636C),
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.restart_alt_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'TIMEPLANNER_restart_alt_rounded_ICN_ON_T');
                                                      logFirebaseEvent(
                                                          'IconButton_alert_dialog');
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        '重置課表'),
                                                                    content: const Text(
                                                                        '確定要重置課表嗎?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: const Text(
                                                                            '取消'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: const Text(
                                                                            '確認'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        await FFAppState()
                                                            .coursecurriculumRef!
                                                            .delete();
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'user_curriculum2':
                                                                  FieldValue
                                                                      .delete(),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState()
                                                                .coursecurriculumRef =
                                                            FirebaseFirestore
                                                                .instance
                                                                .doc(
                                                                    '/course_curriculum/default');
                                                        FFAppState()
                                                            .courseDayTime = [];
                                                        FFAppState()
                                                            .chooseCourseRef = [];
                                                        logFirebaseEvent(
                                                            'IconButton_update_page_state');
                                                        _model.courseDocs = [];
                                                        setState(() {});
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 40.0, 5.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        const Color(0xFF42BAF1),
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'TIMEPLANNER_PAGE_add_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_firestore_query');
                                                      _model.existNYCU =
                                                          await queryCourseCurriculumRecordOnce(
                                                        queryBuilder:
                                                            (courseCurriculumRecord) =>
                                                                courseCurriculumRecord
                                                                    .where(
                                                          'user_ref',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      logFirebaseEvent(
                                                          'IconButton_firestore_query');
                                                      _model.outputNYCUcourseindex =
                                                          await queryCourseIndexListRecordOnce(
                                                        queryBuilder:
                                                            (courseIndexListRecord) =>
                                                                courseIndexListRecord
                                                                    .where(
                                                          'index',
                                                          isEqualTo: 2,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (_model.existNYCU !=
                                                          null) {
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState().currindex =
                                                            _model
                                                                .outputNYCUcourseindex!
                                                                .courseIndex
                                                                .toList()
                                                                .cast<String>();
                                                        setState(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState().currindex =
                                                            _model
                                                                .outputNYCUcourseindex!
                                                                .courseIndex
                                                                .toList()
                                                                .cast<String>();
                                                        setState(() {});
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');

                                                        var courseCurriculumRecordReference =
                                                            CourseCurriculumRecord
                                                                .collection
                                                                .doc();
                                                        await courseCurriculumRecordReference
                                                            .set({
                                                          ...createCourseCurriculumRecordData(
                                                            userRef:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'curr_index':
                                                                  FFAppState()
                                                                      .currindex,
                                                            },
                                                          ),
                                                        });
                                                        _model.newCirbuttomNYCU =
                                                            CourseCurriculumRecord
                                                                .getDocumentFromData({
                                                          ...createCourseCurriculumRecordData(
                                                            userRef:
                                                                currentUserReference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'curr_index':
                                                                  FFAppState()
                                                                      .currindex,
                                                            },
                                                          ),
                                                        }, courseCurriculumRecordReference);
                                                        logFirebaseEvent(
                                                            'IconButton_update_app_state');
                                                        FFAppState()
                                                                .coursecurriculumRef =
                                                            _model
                                                                .newCirbuttomNYCU
                                                                ?.reference;
                                                      }

                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: const SizedBox(
                                                                height: 700.0,
                                                                child:
                                                                    SelectcoursesWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.bottomreturnNYCU =
                                                                  value));

                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 800.0,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 65.0,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'y',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '06:00\n06:50',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 60.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'z',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '07:00\n07:50',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '1',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '08:00\n08:50',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '2',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '09:00\n09:50',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '3',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '10:10\n11:00',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '4',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '11:10\n12:00',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'n',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '12:10\n13:00',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '5',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '13:20\n14:10',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '6',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '14:20\n15:10',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '7',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '15:30\n16:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '8',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '16:30\n17:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '9',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '17:30\n18:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'a',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '18:30\n19:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'b',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '19:30\n20:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'c',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '20:30\n21:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 44.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'd',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'YuPearl',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '21:30\n22:20',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'YuPearl',
                                                                    color: const Color(
                                                                        0xFF72747C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 80.0,
                                                    child: Divider(
                                                      height: 0.1,
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: StreamBuilder<
                                                  List<CourseCurriculumRecord>>(
                                                stream:
                                                    queryCourseCurriculumRecord(
                                                  queryBuilder:
                                                      (courseCurriculumRecord) =>
                                                          courseCurriculumRecord
                                                              .where(
                                                    'user_ref',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CourseCurriculumRecord>
                                                      containerCourseCurriculumRecordList =
                                                      snapshot.data!;
                                                  final containerCourseCurriculumRecord =
                                                      containerCourseCurriculumRecordList
                                                              .isNotEmpty
                                                          ? containerCourseCurriculumRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final curriNYCU =
                                                            containerCourseCurriculumRecord
                                                                    ?.currIndex
                                                                    .map((e) =>
                                                                        e)
                                                                    .toList()
                                                                    .toList() ??
                                                                [];
                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 7,
                                                            crossAxisSpacing:
                                                                2.0,
                                                            childAspectRatio: functions
                                                                .calenderWidthchangeNYCU(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width),
                                                          ),
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              curriNYCU.length,
                                                          itemBuilder: (context,
                                                              curriNYCUIndex) {
                                                            final curriNYCUItem =
                                                                curriNYCU[
                                                                    curriNYCUIndex];
                                                            return InkWell(
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
                                                                    'TIMEPLANNER_Container_hqinaj7c_ON_TAP');
                                                                if (functions
                                                                        .finditemInDocs(
                                                                            (_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(),
                                                                            curriNYCUItem)
                                                                        ?.reference !=
                                                                    null) {
                                                                  logFirebaseEvent(
                                                                      'Container_custom_action');
                                                                  _model.outputcolorNYCU =
                                                                      await actions
                                                                          .flutterColorpac(
                                                                    context,
                                                                    colorFromCssString(
                                                                      functions.findCoursecustomColor(functions.finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)?.reference, containerCourseCurriculumRecord.customColor.toList()) !=
                                                                              'default'
                                                                          ? functions.findCoursecustomColor(
                                                                              functions.finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)?.reference,
                                                                              containerCourseCurriculumRecord.customColor.toList())
                                                                          : valueOrDefault<String>(
                                                                              functions.finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)?.color,
                                                                              '#FFFFFF',
                                                                            ),
                                                                      defaultColor:
                                                                          Colors
                                                                              .white,
                                                                    ),
                                                                  );
                                                                  if (_model
                                                                          .outputcolorNYCU !=
                                                                      null) {
                                                                    logFirebaseEvent(
                                                                        'Container_custom_action');
                                                                    _model.outputcustomcolorNYCU =
                                                                        await actions
                                                                            .getCustomColorspecificoption(
                                                                      containerCourseCurriculumRecord
                                                                          .customColor
                                                                          .toList(),
                                                                      functions
                                                                          .finditemInDocs(
                                                                              (_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(),
                                                                              curriNYCUItem)!
                                                                          .reference,
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Container_custom_action');
                                                                    _model.changedocNYCU =
                                                                        await actions
                                                                            .finditemiDocsaction(
                                                                      (_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty
                                                                              ? _model.bottomreturnNYCU
                                                                              : _model.courseDocs)
                                                                          ?.toList(),
                                                                      curriNYCUItem,
                                                                    );
                                                                    if (_model
                                                                            .outputcustomcolorNYCU ==
                                                                        null) {
                                                                      logFirebaseEvent(
                                                                          'Container_custom_action');
                                                                      _model.colorOutput1NYCU =
                                                                          await actions
                                                                              .turnColortoString(
                                                                        _model
                                                                            .outputcolorNYCU!,
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await containerCourseCurriculumRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'custom_color':
                                                                                FieldValue.arrayUnion([
                                                                              getCustomColorFirestoreData(
                                                                                updateCustomColorStruct(
                                                                                  CustomColorStruct(
                                                                                    choseCourse: _model.changedocNYCU?.reference,
                                                                                    color: _model.colorOutput1NYCU,
                                                                                  ),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.customColor = containerCourseCurriculumRecord
                                                                          .customColor
                                                                          .toList()
                                                                          .cast<
                                                                              CustomColorStruct>();
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await containerCourseCurriculumRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'custom_color':
                                                                                FieldValue.arrayRemove([
                                                                              getCustomColorFirestoreData(
                                                                                updateCustomColorStruct(
                                                                                  _model.outputcustomcolorNYCU,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_custom_action');
                                                                      _model.colorOutput2NYCU =
                                                                          await actions
                                                                              .turnColortoString(
                                                                        _model
                                                                            .outputcolorNYCU!,
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await containerCourseCurriculumRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'custom_color':
                                                                                FieldValue.arrayUnion([
                                                                              getCustomColorFirestoreData(
                                                                                updateCustomColorStruct(
                                                                                  CustomColorStruct(
                                                                                    choseCourse: _model.changedocNYCU?.reference,
                                                                                    color: _model.colorOutput2NYCU,
                                                                                  ),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.customColor = containerCourseCurriculumRecord
                                                                          .customColor
                                                                          .toList()
                                                                          .cast<
                                                                              CustomColorStruct>();
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_update_page_state');
                                                                    _model.customColor = containerCourseCurriculumRecord
                                                                        .customColor
                                                                        .toList()
                                                                        .cast<
                                                                            CustomColorStruct>();
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.customColor = containerCourseCurriculumRecord
                                                                      .customColor
                                                                      .toList()
                                                                      .cast<
                                                                          CustomColorStruct>();
                                                                  setState(
                                                                      () {});
                                                                }

                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                width: 44.0,
                                                                height: 44.0,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  minWidth:
                                                                      44.0,
                                                                  minHeight:
                                                                      44.0,
                                                                  maxWidth:
                                                                      44.0,
                                                                  maxHeight:
                                                                      44.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      colorFromCssString(
                                                                    functions.findCoursecustomColor(functions.finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)?.reference, containerCourseCurriculumRecord!.customColor.toList()) !=
                                                                            'default'
                                                                        ? functions.findCoursecustomColor(
                                                                            functions.finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)?.reference,
                                                                            containerCourseCurriculumRecord.customColor.toList())
                                                                        : valueOrDefault<String>(
                                                                            functions.finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)?.color,
                                                                            '#FFFFFF',
                                                                          ),
                                                                    defaultColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          1.0,
                                                                          2.0,
                                                                          1.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)
                                                                              ?.chineseName,
                                                                          '無課程資訊',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              6,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              10.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const Spacer(),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          1.0,
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .finditemInDocs((_model.bottomreturnNYCU != null && (_model.bottomreturnNYCU)!.isNotEmpty ? _model.bottomreturnNYCU : _model.courseDocs)?.toList(), curriNYCUItem)
                                                                              ?.classroom,
                                                                          '無教室名稱',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              6,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontSize:
                                                                              7.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 30.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor: const Color(0xFF42BAF1),
                                                icon: Icon(
                                                  Icons.add_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'TIMEPLANNER_PAGE_add_rounded_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_update_page_state');
                                                  _model.addTaskMode =
                                                      !_model.addTaskMode;
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<TasksRecord>>(
                                                stream: _model.todolist(
                                                  requestFn: () =>
                                                      queryTasksRecord(
                                                    queryBuilder:
                                                        (tasksRecord) =>
                                                            tasksRecord
                                                                .where(
                                                                  'user',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                )
                                                                .orderBy(
                                                                    'created',
                                                                    descending:
                                                                        true),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TasksRecord>
                                                      listViewTasksRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewTasksRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewTasksRecord =
                                                          listViewTasksRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    8.0),
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
                                                                'TIMEPLANNER_PAGE_menuItem_ON_TAP');
                                                            logFirebaseEvent(
                                                                'menuItem_navigate_to');

                                                            context.pushNamed(
                                                              'DetailPage',
                                                              queryParameters: {
                                                                'taskDoc':
                                                                    serializeParam(
                                                                  listViewTasksRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'taskDoc':
                                                                    listViewTasksRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x411D2429),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    1.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listViewTasksRecord.title,
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: const Color(0xFF0F1113),
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              listViewTasksRecord.details.maybeHandleOverflow(
                                                                                maxChars: 70,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    color: const Color(0xFF57636C),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                            logFirebaseEvent('TIMEPLANNER_PAGE_Icon_qpxrce76_ON_TAP');
                                                                            logFirebaseEvent('Icon_alert_dialog');
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: const Text('移除任務'),
                                                                                      content: const Text('確定要移除任務？'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                          child: const Text('取消'),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                          child: const Text('移除'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              logFirebaseEvent('Icon_backend_call');
                                                                              await listViewTasksRecord.reference.delete();
                                                                            }
                                                                          },
                                                                          child:
                                                                              const Icon(
                                                                            Icons.delete_rounded,
                                                                            color:
                                                                                Color(0x7657636C),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                      if (_model.addTaskMode == true)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
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
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(32.0),
                                                topRight: Radius.circular(32.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(24.0),
                                              child: ListView(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowIconButton(
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
                                                          icon: Icon(
                                                            Icons.close_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'TIMEPLANNER_close_rounded_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_update_page_state');
                                                            _model.addTaskMode =
                                                                false;
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '添加任務',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'YuPearl',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Form(
                                                    key: _model.formKey2,
                                                    autovalidateMode:
                                                        AutovalidateMode.always,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                              .textController3,
                                                          focusNode: _model
                                                              .textFieldFocusNode3,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController3',
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                            () =>
                                                                setState(() {}),
                                                          ),
                                                          autofocus: false,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .sentences,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
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
                                                            hintText: '主題',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
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
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'YuPearl',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          maxLines: null,
                                                          minLines: 1,
                                                          validator: _model
                                                              .textController3Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        TextFormField(
                                                          controller: _model
                                                              .textController4,
                                                          focusNode: _model
                                                              .textFieldFocusNode4,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController4',
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                            () =>
                                                                setState(() {}),
                                                          ),
                                                          autofocus: false,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .sentences,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'YuPearl',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            hintText: '任務內容...',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'YuPearl',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'YuPearl',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          maxLines: null,
                                                          minLines: 1,
                                                          validator: _model
                                                              .textController4Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: ((_model.textController3.text ==
                                                                              '') ||
                                                                      (_model.textController4.text ==
                                                                              '')
                                                                  ? true
                                                                  : false)
                                                              ? null
                                                              : () async {
                                                                  logFirebaseEvent(
                                                                      'TIMEPLANNER_PAGE_添加任務_BTN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');

                                                                  await TasksRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createTasksRecordData(
                                                                        title: _model
                                                                            .textController3
                                                                            .text,
                                                                        details: _model
                                                                            .textController4
                                                                            .text,
                                                                        completed:
                                                                            false,
                                                                        user:
                                                                            currentUserReference,
                                                                        created:
                                                                            getCurrentTimestamp,
                                                                      ));
                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.addTaskMode =
                                                                      false;
                                                                  setState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_clear_text_fields_pin_codes');
                                                                  setState(() {
                                                                    _model
                                                                        .textController3
                                                                        ?.clear();
                                                                    _model
                                                                        .textController4
                                                                        ?.clear();
                                                                  });
                                                                },
                                                          text: '添加任務',
                                                          icon: const Icon(
                                                            Icons.add,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 250.0,
                                                            height: 50.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: const Color(
                                                                0xFF42BAF1),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'YuPearl',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                            disabledColor:
                                                                const Color(
                                                                    0xFFDBDCDE),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
              if (_model.schoolchosed == false)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 180.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Color(0x9E1D2429),
                                )
                              ],
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 30.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 70.0, 0.0),
                                          child: Text(
                                            '選擇您的學校',
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'YuPearl',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          icon: Icon(
                                            Icons.check_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'TIMEPLANNER_check_outlined_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_backend_call');

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              school: _model.dropDownValue,
                                            ));
                                            logFirebaseEvent(
                                                'IconButton_custom_action');
                                            _model.outputindex = await actions
                                                .defineUschoolindex(
                                              _model.dropDownValue!,
                                            );
                                            logFirebaseEvent(
                                                'IconButton_firestore_query');
                                            _model.courseIndexList =
                                                await queryCourseIndexListRecordOnce(
                                              queryBuilder:
                                                  (courseIndexListRecord) =>
                                                      courseIndexListRecord
                                                          .where(
                                                'index',
                                                isEqualTo: _model.outputindex,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            logFirebaseEvent(
                                                'IconButton_firestore_query');
                                            _model.courseCurri =
                                                await queryCourseCurriculumRecordOnce(
                                              queryBuilder:
                                                  (courseCurriculumRecord) =>
                                                      courseCurriculumRecord
                                                          .where(
                                                'user_ref',
                                                isEqualTo: currentUserReference,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            if (_model.courseCurri != null) {
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              await _model
                                                  .courseCurri!.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'curr_index': _model
                                                        .courseIndexList
                                                        ?.courseIndex,
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              FFAppState().currindex = _model
                                                  .courseIndexList!.courseIndex
                                                  .toList()
                                                  .cast<String>();
                                              FFAppState().update(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'IconButton_backend_call');

                                              var courseCurriculumRecordReference =
                                                  CourseCurriculumRecord
                                                      .collection
                                                      .doc();
                                              await courseCurriculumRecordReference
                                                  .set({
                                                ...createCourseCurriculumRecordData(
                                                  userRef: currentUserReference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'curr_index': _model
                                                        .courseIndexList
                                                        ?.courseIndex,
                                                  },
                                                ),
                                              });
                                              _model.newCirPop =
                                                  CourseCurriculumRecord
                                                      .getDocumentFromData({
                                                ...createCourseCurriculumRecordData(
                                                  userRef: currentUserReference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'curr_index': _model
                                                        .courseIndexList
                                                        ?.courseIndex,
                                                  },
                                                ),
                                              }, courseCurriculumRecordReference);
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              FFAppState().coursecurriculumRef =
                                                  _model.newCirPop?.reference;
                                              logFirebaseEvent(
                                                  'IconButton_update_app_state');
                                              FFAppState().currindex = _model
                                                  .courseIndexList!.courseIndex
                                                  .toList()
                                                  .cast<String>();
                                              FFAppState().update(() {});
                                            }

                                            logFirebaseEvent(
                                                'IconButton_update_page_state');
                                            _model.schoolchosed = true;
                                            setState(() {});

                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options: const ['國立清華大學', '國立陽明交通大學'],
                                          onChanged: (val) => setState(
                                              () => _model.dropDownValue = val),
                                          width: 250.0,
                                          height: 56.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'YuPearl',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'YuPearl',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'YuPearl',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          hintText: '選擇您的學校',
                                          searchHintText: '',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
