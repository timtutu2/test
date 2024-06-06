import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'selectcourses_model.dart';
export 'selectcourses_model.dart';

class SelectcoursesWidget extends StatefulWidget {
  const SelectcoursesWidget({super.key});

  @override
  State<SelectcoursesWidget> createState() => _SelectcoursesWidgetState();
}

class _SelectcoursesWidgetState extends State<SelectcoursesWidget>
    with TickerProviderStateMixin {
  late SelectcoursesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectcoursesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SELECTCOURSES_selectcourses_ON_INIT_STAT');
      logFirebaseEvent('selectcourses_custom_action');
      await actions.hideKeyboard();
      logFirebaseEvent('selectcourses_update_component_state');
      _model.compschool = valueOrDefault(currentUserDocument?.school, '');
      setState(() {});
      logFirebaseEvent('selectcourses_update_component_state');
      _model.compsemester = _model.dropDownSValue;
      setState(() {});
    });

    _model.textController ??= TextEditingController();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: StreamBuilder<List<NthuCoursesRecord>>(
        stream: FFAppState().courseSelectCache(
          uniqueQueryKey: functions.selectcoursecache(
              functions.schoolcheck(_model.compschool!)!,
              valueOrDefault<String>(
                _model.compsemester,
                '113-1',
              )),
          requestFn: () => queryNthuCoursesRecord(
            queryBuilder: (nthuCoursesRecord) => nthuCoursesRecord
                .where(
                  'school',
                  isEqualTo: functions.schoolcheck(_model.compschool!),
                )
                .where(
                  'semester',
                  isEqualTo: functions.fakeFsemester(_model.compsemester!),
                )
                .orderBy('index'),
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
          List<NthuCoursesRecord> containerNthuCoursesRecordList =
              snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).info,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 70.0,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).info,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            fillColor: FlutterFlowTheme.of(context).info,
                            icon: Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 32.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SELECTCOURSES_check_rounded_ICN_ON_TAP');
                              if (FFAppState().chooseCourseRef.isEmpty) {
                                logFirebaseEvent('IconButton_backend_call');

                                await FFAppState().coursecurriculumRef!.update({
                                  ...createCourseCurriculumRecordData(
                                    userRef: currentUserReference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'course_ref': FieldValue.delete(),
                                      'course_day_time': FieldValue.delete(),
                                    },
                                  ),
                                });
                                logFirebaseEvent('IconButton_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'user_curriculum2': FieldValue.delete(),
                                    },
                                  ),
                                });
                                logFirebaseEvent(
                                    'IconButton_update_component_state');

                                setState(() {});
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().isSearching = false;
                                setState(() {});
                              } else {
                                logFirebaseEvent('IconButton_backend_call');

                                await FFAppState().coursecurriculumRef!.update({
                                  ...createCourseCurriculumRecordData(
                                    userRef: currentUserReference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'course_ref':
                                          FFAppState().chooseCourseRef,
                                      'course_day_time':
                                          FFAppState().courseDayTime,
                                    },
                                  ),
                                });
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().oldCourse = (currentUserDocument
                                            ?.userCurriculum2
                                            .toList() ??
                                        [])
                                    .toList()
                                    .cast<DocumentReference>();
                                setState(() {});
                                logFirebaseEvent('IconButton_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'user_curriculum2':
                                          FFAppState().chooseCourseRef,
                                    },
                                  ),
                                });
                                logFirebaseEvent('IconButton_custom_action');
                                _model.outputcourse =
                                    await actions.turnalldofreftodoe(
                                  FFAppState().chooseCourseRef.toList(),
                                );
                                logFirebaseEvent(
                                    'IconButton_update_component_state');
                                _model.componentdoc = _model.outputcourse!
                                    .toList()
                                    .cast<NthuCoursesRecord>();
                                setState(() {});
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().isSearching = false;
                                setState(() {});
                              }

                              logFirebaseEvent('IconButton_bottom_sheet');
                              Navigator.pop(context, _model.componentdoc);
                              logFirebaseEvent('IconButton_navigate_to');

                              context.goNamed('timeplanner');

                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(
                              _model.dropDownValue ??= valueOrDefault(
                                  currentUserDocument?.school, ''),
                            ),
                            options: const ['國立清華大學', '國立陽明交通大學'],
                            onChanged: (val) async {
                              setState(() => _model.dropDownValue = val);
                              logFirebaseEvent(
                                  'SELECTCOURSES_DropDown_o6bkqdiv_ON_FORM_');
                              logFirebaseEvent(
                                  'DropDown_update_component_state');
                              _model.compschool = _model.dropDownValue;
                              setState(() {});
                            },
                            width: 235.0,
                            height: 56.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'YuPearl',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'YuPearl',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'YuPearl',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            hintText: '您的學校',
                            searchHintText: '您的學校...',
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color(0xFF42BAF1),
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).info,
                            elevation: 2.0,
                            borderColor: const Color(0xFF42BAF1),
                            borderWidth: 1.5,
                            borderRadius: 16.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownSValueController ??=
                              FormFieldController<String>(
                            _model.dropDownSValue ??= '112-2',
                          ),
                          options: const ['112-2', '113-1'],
                          onChanged: (val) async {
                            setState(() => _model.dropDownSValue = val);
                            logFirebaseEvent(
                                'SELECTCOURSES_DropDownS_ON_FORM_WIDGET_S');
                            logFirebaseEvent(
                                'DropDownS_update_component_state');
                            _model.compsemester = _model.dropDownSValue;
                            _model.updatePage(() {});
                          },
                          width: 90.0,
                          height: 56.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'YuPearl',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'YuPearl',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'YuPearl',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintText: '學期',
                          searchHintText: '學期',
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: FlutterFlowTheme.of(context).info,
                          elevation: 2.0,
                          borderColor: const Color(0xFF42BAF1),
                          borderWidth: 1.0,
                          borderRadius: 16.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 4.0, 5.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 65.0, 12.0),
                                child: Autocomplete<String>(
                                  initialValue: const TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return containerNthuCoursesRecordList
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
                                      textFieldKey: _model.textFieldKey,
                                      textController: _model.textController!,
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
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      maxHeight: 200.0,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    setState(() => _model
                                        .textFieldSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.textFieldFocusNode = focusNode;

                                    _model.textController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.textFieldKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'SELECTCOURSES_TextField_o339vkoy_ON_TEXT');
                                          logFirebaseEvent(
                                              'TextField_simple_search');
                                          safeSetState(() {
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              containerNthuCoursesRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.chineseName
                                                    ]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .textController.text)
                                                    .map((r) => r.object)
                                                    .toList();
                                          });
                                          logFirebaseEvent(
                                              'TextField_update_app_state');
                                          FFAppState().isSearching = true;
                                          setState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'YuPearl',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        hintText: '搜尋課程名稱 (建議打全名)',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'YuPearl',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x9B14181B),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Color(0xFF434343),
                                          size: 20.0,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'YuPearl',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      maxLines: null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 12.0, 20.0, 12.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).accent1,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SELECTCOURSES_close_rounded_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_clear_text_fields_pin_codes');
                                setState(() {
                                  _model.textController?.clear();
                                });
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().isSearching = false;
                                setState(() {});
                                logFirebaseEvent('IconButton_custom_action');
                                await actions.hideKeyboard();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor: const Color(0x8E57636C),
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'YuPearl',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          unselectedLabelStyle: const TextStyle(),
                          indicatorColor: const Color(0xFF42BAF1),
                          tabs: const [
                            Tab(
                              text: '所有課程',
                            ),
                            Tab(
                              text: '已加入之課程',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (!FFAppState().isSearching)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final coursesNoSearch =
                                                containerNthuCoursesRecordList
                                                    .map((e) => e)
                                                    .toList();
                                            return ListView.separated(
                                              padding: const EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                90.0,
                                              ),
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount: coursesNoSearch.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 8.0),
                                              itemBuilder: (context,
                                                  coursesNoSearchIndex) {
                                                final coursesNoSearchItem =
                                                    coursesNoSearch[
                                                        coursesNoSearchIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 5.0, 20.0, 5.0),
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
                                                          'SELECTCOURSES_Container_mjea03yc_ON_TAP');
                                                      if (FFAppState()
                                                              .chooseCourseRef.isEmpty) {
                                                        while (_model
                                                                .itemcount! <
                                                            coursesNoSearchItem
                                                                .time.length) {
                                                          logFirebaseEvent(
                                                              'Container_update_app_state');
                                                          FFAppState().addToCourseDayTime(
                                                              coursesNoSearchItem
                                                                      .time[
                                                                  _model
                                                                      .itemcount!]);
                                                          logFirebaseEvent(
                                                              'Container_update_component_state');
                                                          _model.itemcount =
                                                              _model.itemcount! +
                                                                  1;
                                                        }
                                                        logFirebaseEvent(
                                                            'Container_update_component_state');
                                                        _model.itemcount = 0;
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState()
                                                            .addToChooseCourseRef(
                                                                coursesNoSearchItem
                                                                    .reference);
                                                        setState(() {});
                                                        return;
                                                      }
                                                      while (_model.timecount! <
                                                          coursesNoSearchItem
                                                              .time.length) {
                                                        if (!FFAppState()
                                                            .courseDayTime
                                                            .contains(
                                                                coursesNoSearchItem
                                                                        .time[
                                                                    _model
                                                                        .timecount!])) {
                                                          if (_model
                                                                  .timecount ==
                                                              (coursesNoSearchItem
                                                                      .time
                                                                      .length -
                                                                  1)) {
                                                            while (_model
                                                                    .itemcount! <
                                                                coursesNoSearchItem
                                                                    .time
                                                                    .length) {
                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState().addToCourseDayTime(
                                                                  coursesNoSearchItem
                                                                          .time[
                                                                      _model
                                                                          .itemcount!]);
                                                              logFirebaseEvent(
                                                                  'Container_update_component_state');
                                                              _model.itemcount =
                                                                  _model.itemcount! +
                                                                      1;
                                                            }
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.itemcount =
                                                                0;
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState().addToChooseCourseRef(
                                                                coursesNoSearchItem
                                                                    .reference);
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.timecount =
                                                                0;
                                                            return;
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.timecount =
                                                                _model.timecount! +
                                                                    1;
                                                          }
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_update_component_state');
                                                          _model.timecount = 0;
                                                          logFirebaseEvent(
                                                              'Container_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    '衝堂 !'),
                                                                content: const Text(
                                                                    '與先前所選課程衝堂 !'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        '繼續選課'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 110.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 6.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                    .chooseCourseRef
                                                                    .contains(
                                                                        coursesNoSearchItem
                                                                            .reference)
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                          ),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              coursesNoSearchItem.chineseName.maybeHandleOverflow(
                                                                                maxChars: 15,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              coursesNoSearchItem.englishName.maybeHandleOverflow(
                                                                                maxChars: 25,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const Spacer(),
                                                                      if (FFAppState()
                                                                          .chooseCourseRef
                                                                          .contains(
                                                                              coursesNoSearchItem.reference))
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.highlight_off,
                                                                            color:
                                                                                Color(0xD0F93C3C),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('SELECTCOURSES_highlight_off_ICN_ON_TAP');
                                                                            while (_model.itemcount! <
                                                                                coursesNoSearchItem.time.length) {
                                                                              if (FFAppState().courseDayTime.contains(coursesNoSearchItem.time[_model.itemcount!])) {
                                                                                logFirebaseEvent('IconButton_update_app_state');
                                                                                FFAppState().removeFromCourseDayTime(coursesNoSearchItem.time[_model.itemcount!]);
                                                                                if (_model.itemcount == (coursesNoSearchItem.time.length - 1)) {
                                                                                  logFirebaseEvent('IconButton_update_app_state');
                                                                                  FFAppState().removeFromChooseCourseRef(coursesNoSearchItem.reference);
                                                                                  setState(() {});
                                                                                  logFirebaseEvent('IconButton_update_component_state');
                                                                                  _model.itemcount = 0;
                                                                                  return;
                                                                                } else {
                                                                                  logFirebaseEvent('IconButton_update_component_state');
                                                                                  _model.itemcount = _model.itemcount! + 1;
                                                                                }
                                                                              } else {
                                                                                logFirebaseEvent('IconButton_update_component_state');
                                                                                _model.itemcount = _model.itemcount! + 1;
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.4,
                                                              child: Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      coursesNoSearchItem
                                                                          .teacher
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            12,
                                                                        replacement:
                                                                            '…',
                                                                      ),
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
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        coursesNoSearchItem
                                                                            .timeString,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'YuPearl',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.7,
                                                              child: Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().isSearching)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final courseWithSearch = _model
                                                .simpleSearchResults
                                                .toList();
                                            return ListView.separated(
                                              padding: const EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                90.0,
                                              ),
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  courseWithSearch.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 8.0),
                                              itemBuilder: (context,
                                                  courseWithSearchIndex) {
                                                final courseWithSearchItem =
                                                    courseWithSearch[
                                                        courseWithSearchIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 5.0, 20.0, 5.0),
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
                                                          'SELECTCOURSES_Container_3v7tb3cs_ON_TAP');
                                                      if (FFAppState()
                                                              .chooseCourseRef.isEmpty) {
                                                        while (_model
                                                                .itemcount! <
                                                            courseWithSearchItem
                                                                .time.length) {
                                                          logFirebaseEvent(
                                                              'Container_update_app_state');
                                                          FFAppState().addToCourseDayTime(
                                                              courseWithSearchItem
                                                                      .time[
                                                                  _model
                                                                      .itemcount!]);
                                                          logFirebaseEvent(
                                                              'Container_update_component_state');
                                                          _model.itemcount =
                                                              _model.itemcount! +
                                                                  1;
                                                        }
                                                        logFirebaseEvent(
                                                            'Container_update_component_state');
                                                        _model.itemcount = 0;
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState()
                                                            .addToChooseCourseRef(
                                                                courseWithSearchItem
                                                                    .reference);
                                                        setState(() {});
                                                        return;
                                                      }
                                                      while (_model.timecount! <
                                                          courseWithSearchItem
                                                              .time.length) {
                                                        if (!FFAppState()
                                                            .courseDayTime
                                                            .contains(
                                                                courseWithSearchItem
                                                                        .time[
                                                                    _model
                                                                        .timecount!])) {
                                                          if (_model
                                                                  .timecount ==
                                                              (courseWithSearchItem
                                                                      .time
                                                                      .length -
                                                                  1)) {
                                                            while (_model
                                                                    .itemcount! <
                                                                courseWithSearchItem
                                                                    .time
                                                                    .length) {
                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState().addToCourseDayTime(
                                                                  courseWithSearchItem
                                                                          .time[
                                                                      _model
                                                                          .itemcount!]);
                                                              logFirebaseEvent(
                                                                  'Container_update_component_state');
                                                              _model.itemcount =
                                                                  _model.itemcount! +
                                                                      1;
                                                            }
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.itemcount =
                                                                0;
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState().addToChooseCourseRef(
                                                                courseWithSearchItem
                                                                    .reference);
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.timecount =
                                                                0;
                                                            return;
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.timecount =
                                                                _model.timecount! +
                                                                    1;
                                                          }
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_update_component_state');
                                                          _model.timecount = 0;
                                                          logFirebaseEvent(
                                                              'Container_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    '衝堂 !'),
                                                                content: const Text(
                                                                    '與先前所選課程衝堂 !'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        '繼續選課'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 110.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 6.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                    .chooseCourseRef
                                                                    .contains(
                                                                        courseWithSearchItem
                                                                            .reference)
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                          ),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              courseWithSearchItem.chineseName.maybeHandleOverflow(
                                                                                maxChars: 15,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              courseWithSearchItem.englishName.maybeHandleOverflow(
                                                                                maxChars: 25,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const Spacer(),
                                                                      if (FFAppState()
                                                                          .chooseCourseRef
                                                                          .contains(
                                                                              courseWithSearchItem.reference))
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.highlight_off,
                                                                            color:
                                                                                Color(0xD0F93C3C),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('SELECTCOURSES_highlight_off_ICN_ON_TAP');
                                                                            while (_model.itemcount! <
                                                                                courseWithSearchItem.time.length) {
                                                                              if (FFAppState().courseDayTime.contains(courseWithSearchItem.time[_model.itemcount!])) {
                                                                                logFirebaseEvent('IconButton_update_app_state');
                                                                                FFAppState().removeFromCourseDayTime(courseWithSearchItem.time[_model.itemcount!]);
                                                                                if (_model.itemcount == (courseWithSearchItem.time.length - 1)) {
                                                                                  logFirebaseEvent('IconButton_update_app_state');
                                                                                  FFAppState().removeFromChooseCourseRef(courseWithSearchItem.reference);
                                                                                  setState(() {});
                                                                                  logFirebaseEvent('IconButton_update_component_state');
                                                                                  _model.itemcount = 0;
                                                                                  return;
                                                                                } else {
                                                                                  logFirebaseEvent('IconButton_update_component_state');
                                                                                  _model.itemcount = _model.itemcount! + 1;
                                                                                }
                                                                              } else {
                                                                                logFirebaseEvent('IconButton_update_component_state');
                                                                                _model.itemcount = _model.itemcount! + 1;
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.4,
                                                              child: Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      courseWithSearchItem
                                                                          .teacher
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            12,
                                                                        replacement:
                                                                            '…',
                                                                      ),
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
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        courseWithSearchItem
                                                                            .timeString,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'YuPearl',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.7,
                                                              child: Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (!FFAppState().isSearching)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final addCoursesNoSearch =
                                                containerNthuCoursesRecordList
                                                    .where((e) => FFAppState()
                                                        .chooseCourseRef
                                                        .contains(e.reference))
                                                    .toList();
                                            return ListView.separated(
                                              padding: const EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                90.0,
                                              ),
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  addCoursesNoSearch.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 8.0),
                                              itemBuilder: (context,
                                                  addCoursesNoSearchIndex) {
                                                final addCoursesNoSearchItem =
                                                    addCoursesNoSearch[
                                                        addCoursesNoSearchIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 5.0, 20.0, 5.0),
                                                  child: Container(
                                                    height: 110.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 6.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          FFAppState()
                                                                  .chooseCourseRef
                                                                  .contains(
                                                                      addCoursesNoSearchItem
                                                                          .reference)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
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
                                                                            addCoursesNoSearchItem.chineseName.maybeHandleOverflow(
                                                                              maxChars: 15,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'YuPearl',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Text(
                                                                            addCoursesNoSearchItem.englishName.maybeHandleOverflow(
                                                                              maxChars: 25,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'YuPearl',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children:
                                                                          [
                                                                        if (FFAppState()
                                                                            .chooseCourseRef
                                                                            .contains(addCoursesNoSearchItem.reference))
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                Colors.white,
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.highlight_off,
                                                                              color: Color(0xD0F93C3C),
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('SELECTCOURSES_highlight_off_ICN_ON_TAP');
                                                                              while (_model.itemcount! < addCoursesNoSearchItem.time.length) {
                                                                                if (FFAppState().courseDayTime.contains(addCoursesNoSearchItem.time[_model.itemcount!])) {
                                                                                  logFirebaseEvent('IconButton_update_app_state');
                                                                                  FFAppState().removeFromCourseDayTime(addCoursesNoSearchItem.time[_model.itemcount!]);
                                                                                  if (_model.itemcount == (addCoursesNoSearchItem.time.length - 1)) {
                                                                                    logFirebaseEvent('IconButton_update_app_state');
                                                                                    FFAppState().removeFromChooseCourseRef(addCoursesNoSearchItem.reference);
                                                                                    setState(() {});
                                                                                    logFirebaseEvent('IconButton_update_component_state');
                                                                                    _model.itemcount = 0;
                                                                                    return;
                                                                                  } else {
                                                                                    logFirebaseEvent('IconButton_update_component_state');
                                                                                    _model.itemcount = _model.itemcount! + 1;
                                                                                  }
                                                                                } else {
                                                                                  logFirebaseEvent('IconButton_update_component_state');
                                                                                  _model.itemcount = _model.itemcount! + 1;
                                                                                }
                                                                              }
                                                                            },
                                                                          ),
                                                                      ].divide(const SizedBox(
                                                                              width: 5.0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                                          Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    addCoursesNoSearchItem
                                                                        .teacher
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          12,
                                                                      replacement:
                                                                          '…',
                                                                    ),
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
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            50.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      addCoursesNoSearchItem
                                                                          .timeString,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'YuPearl',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
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
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().isSearching)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final addCoursesWithSearch = _model
                                                .simpleSearchResults
                                                .where((e) => FFAppState()
                                                    .chooseCourseRef
                                                    .contains(e.reference))
                                                .toList();
                                            return ListView.separated(
                                              padding: const EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                90.0,
                                              ),
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  addCoursesWithSearch.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 8.0),
                                              itemBuilder: (context,
                                                  addCoursesWithSearchIndex) {
                                                final addCoursesWithSearchItem =
                                                    addCoursesWithSearch[
                                                        addCoursesWithSearchIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 5.0, 20.0, 5.0),
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
                                                          'SELECTCOURSES_Container_0npc50ng_ON_TAP');
                                                      if (FFAppState()
                                                              .chooseCourseRef.isEmpty) {
                                                        while (_model
                                                                .itemcount! <
                                                            addCoursesWithSearchItem
                                                                .time.length) {
                                                          logFirebaseEvent(
                                                              'Container_update_app_state');
                                                          FFAppState().addToCourseDayTime(
                                                              addCoursesWithSearchItem
                                                                      .time[
                                                                  _model
                                                                      .itemcount!]);
                                                          logFirebaseEvent(
                                                              'Container_update_component_state');
                                                          _model.itemcount =
                                                              _model.itemcount! +
                                                                  1;
                                                        }
                                                        logFirebaseEvent(
                                                            'Container_update_component_state');
                                                        _model.itemcount = 0;
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState()
                                                            .addToChooseCourseRef(
                                                                addCoursesWithSearchItem
                                                                    .reference);
                                                        setState(() {});
                                                        return;
                                                      }
                                                      while (_model.timecount! <
                                                          addCoursesWithSearchItem
                                                              .time.length) {
                                                        if (!FFAppState()
                                                            .courseDayTime
                                                            .contains(
                                                                addCoursesWithSearchItem
                                                                        .time[
                                                                    _model
                                                                        .timecount!])) {
                                                          if (_model
                                                                  .timecount ==
                                                              (addCoursesWithSearchItem
                                                                      .time
                                                                      .length -
                                                                  1)) {
                                                            while (_model
                                                                    .itemcount! <
                                                                addCoursesWithSearchItem
                                                                    .time
                                                                    .length) {
                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState().addToCourseDayTime(
                                                                  addCoursesWithSearchItem
                                                                          .time[
                                                                      _model
                                                                          .itemcount!]);
                                                              logFirebaseEvent(
                                                                  'Container_update_component_state');
                                                              _model.itemcount =
                                                                  _model.itemcount! +
                                                                      1;
                                                            }
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.itemcount =
                                                                0;
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState().addToChooseCourseRef(
                                                                addCoursesWithSearchItem
                                                                    .reference);
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.timecount =
                                                                0;
                                                            return;
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_component_state');
                                                            _model.timecount =
                                                                _model.timecount! +
                                                                    1;
                                                          }
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_update_component_state');
                                                          _model.timecount = 0;
                                                          logFirebaseEvent(
                                                              'Container_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    '衝堂 !'),
                                                                content: const Text(
                                                                    '與先前所選課程衝堂 !'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        '繼續選課'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 110.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 6.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                    .chooseCourseRef
                                                                    .contains(
                                                                        addCoursesWithSearchItem
                                                                            .reference)
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                          ),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              addCoursesWithSearchItem.chineseName.maybeHandleOverflow(
                                                                                maxChars: 15,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              addCoursesWithSearchItem.englishName.maybeHandleOverflow(
                                                                                maxChars: 25,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'YuPearl',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          if (FFAppState()
                                                                              .chooseCourseRef
                                                                              .contains(addCoursesWithSearchItem.reference))
                                                                            FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).info,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: Colors.white,
                                                                              icon: const Icon(
                                                                                Icons.highlight_off,
                                                                                color: Color(0xD0F93C3C),
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('SELECTCOURSES_highlight_off_ICN_ON_TAP');
                                                                                while (_model.itemcount! < addCoursesWithSearchItem.time.length) {
                                                                                  if (FFAppState().courseDayTime.contains(addCoursesWithSearchItem.time[_model.itemcount!])) {
                                                                                    logFirebaseEvent('IconButton_update_app_state');
                                                                                    FFAppState().removeFromCourseDayTime(addCoursesWithSearchItem.time[_model.itemcount!]);
                                                                                    if (_model.itemcount == (addCoursesWithSearchItem.time.length - 1)) {
                                                                                      logFirebaseEvent('IconButton_update_app_state');
                                                                                      FFAppState().removeFromChooseCourseRef(addCoursesWithSearchItem.reference);
                                                                                      setState(() {});
                                                                                      logFirebaseEvent('IconButton_update_component_state');
                                                                                      _model.itemcount = 0;
                                                                                      return;
                                                                                    } else {
                                                                                      logFirebaseEvent('IconButton_update_component_state');
                                                                                      _model.itemcount = _model.itemcount! + 1;
                                                                                    }
                                                                                  } else {
                                                                                    logFirebaseEvent('IconButton_update_component_state');
                                                                                    _model.itemcount = _model.itemcount! + 1;
                                                                                  }
                                                                                }
                                                                              },
                                                                            ),
                                                                        ].divide(const SizedBox(width: 5.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.4,
                                                              child: Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      addCoursesWithSearchItem
                                                                          .teacher
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            12,
                                                                        replacement:
                                                                            '…',
                                                                      ),
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
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        addCoursesWithSearchItem
                                                                            .timeString,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'YuPearl',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.7,
                                                              child: Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                                          },
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
          );
        },
      ),
    );
  }
}
