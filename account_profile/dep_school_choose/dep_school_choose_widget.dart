import '/account_profile/show_selectdep/show_selectdep_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dep_school_choose_model.dart';
export 'dep_school_choose_model.dart';

class DepSchoolChooseWidget extends StatefulWidget {
  const DepSchoolChooseWidget({
    super.key,
    required this.frompage,
  });

  final String? frompage;

  @override
  State<DepSchoolChooseWidget> createState() => _DepSchoolChooseWidgetState();
}

class _DepSchoolChooseWidgetState extends State<DepSchoolChooseWidget>
    with TickerProviderStateMixin {
  late DepSchoolChooseModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DepSchoolChooseModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DEP_SCHOOL_CHOOSE_dep_school_choose_ON_I');
      if (valueOrDefault(currentUserDocument?.school, '') != '') {
        logFirebaseEvent('dep_school_choose_firestore_query');
        _model.schoolDep = await querySchoolDepartmentRecordOnce(
          queryBuilder: (schoolDepartmentRecord) =>
              schoolDepartmentRecord.where(
            'school',
            isEqualTo: valueOrDefault(currentUserDocument?.school, ''),
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        logFirebaseEvent('dep_school_choose_update_component_state');
        _model.deplist = _model.schoolDep!.dep.toList().cast<String>();
        setState(() {});
      } else {
        logFirebaseEvent('dep_school_choose_firestore_query');
        _model.schoolDepDafault = await querySchoolDepartmentRecordOnce(
          queryBuilder: (schoolDepartmentRecord) =>
              schoolDepartmentRecord.where(
            'school',
            isEqualTo: '國立清華大學',
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        logFirebaseEvent('dep_school_choose_update_component_state');
        _model.deplist = _model.schoolDepDafault!.dep.toList().cast<String>();
        setState(() {});
      }
    });

    animationsMap.addAll({
      'dropDownOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, -50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dropDownOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, -50.0),
            end: const Offset(0.0, 0.0),
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
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Text(
                  '選擇您的學校與系所',
                  textAlign: TextAlign.justify,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'YuPearl',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: AuthUserStreamWidget(
                  builder: (context) => FlutterFlowDropDown<String>(
                    controller: _model.schoolValueController ??=
                        FormFieldController<String>(
                      _model.schoolValue ??= valueOrDefault(currentUserDocument?.school, '') !=
                                  ''
                          ? valueOrDefault(currentUserDocument?.school, '')
                          : '國立清華大學',
                    ),
                    options: const ['國立清華大學', '國立陽明交通大學'],
                    onChanged: (val) async {
                      setState(() => _model.schoolValue = val);
                      logFirebaseEvent(
                          'DEP_SCHOOL_CHOOSE_school_ON_FORM_WIDGET_');
                      logFirebaseEvent('school_firestore_query');
                      _model.schoolDropdownUpdate =
                          await querySchoolDepartmentRecordOnce(
                        queryBuilder: (schoolDepartmentRecord) =>
                            schoolDepartmentRecord.where(
                          'school',
                          isEqualTo: _model.schoolValue,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      logFirebaseEvent('school_update_component_state');
                      _model.deplist = _model.schoolDropdownUpdate!.dep
                          .toList()
                          .cast<String>();
                      setState(() {});
                      logFirebaseEvent('school_update_component_state');
                      _model.depinitialset = false;
                      setState(() {});
                      logFirebaseEvent('school_reset_form_fields');
                      setState(() {
                        _model.departmentNTHUValueController?.reset();
                      });

                      setState(() {});
                    },
                    width: double.infinity,
                    height: 50.0,
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
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'YuPearl',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    hintText: '你的學校',
                    searchHintText: '您的學校...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: true,
                    isMultiSelect: false,
                  ).animateOnPageLoad(
                      animationsMap['dropDownOnPageLoadAnimation1']!),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.departmentNTHUValueController ??=
                      FormFieldController<String>(null),
                  options: _model.deplist,
                  onChanged: (val) =>
                      setState(() => _model.departmentNTHUValue = val),
                  width: double.infinity,
                  height: 50.0,
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
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'YuPearl',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  hintText: '你的系所',
                  searchHintText: '您的系所...',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: true,
                  isMultiSelect: false,
                ).animateOnPageLoad(
                    animationsMap['dropDownOnPageLoadAnimation2']!),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'DEP_SCHOOL_CHOOSE_COMP_確認_BTN_ON_TAP');
                        if ((_model.schoolValue != null &&
                                _model.schoolValue != '') &&
                            (_model.departmentNTHUValue != null &&
                                _model.departmentNTHUValue != '')) {
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            school: _model.schoolValue,
                            role: _model.departmentNTHUValue,
                          ));
                          logFirebaseEvent('Button_custom_action');
                          _model.outputindex = await actions.defineUschoolindex(
                            _model.schoolValue!,
                          );
                          logFirebaseEvent('Button_firestore_query');
                          _model.curriIndexProfile =
                              await queryCourseIndexListRecordOnce(
                            queryBuilder: (courseIndexListRecord) =>
                                courseIndexListRecord.where(
                              'index',
                              isEqualTo: _model.outputindex,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          logFirebaseEvent('Button_firestore_query');
                          _model.courseCurr =
                              await queryCourseCurriculumRecordOnce(
                            queryBuilder: (courseCurriculumRecord) =>
                                courseCurriculumRecord.where(
                              'user_ref',
                              isEqualTo: currentUserReference,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if (_model.courseCurr != null) {
                            logFirebaseEvent('Button_backend_call');

                            await _model.courseCurr!.reference.update({
                              ...mapToFirestore(
                                {
                                  'curr_index':
                                      _model.curriIndexProfile?.courseIndex,
                                },
                              ),
                            });
                          } else {
                            logFirebaseEvent('Button_backend_call');

                            var courseCurriculumRecordReference =
                                CourseCurriculumRecord.collection.doc();
                            await courseCurriculumRecordReference.set({
                              ...createCourseCurriculumRecordData(
                                userRef: currentUserReference,
                              ),
                              ...mapToFirestore(
                                {
                                  'curr_index':
                                      _model.curriIndexProfile?.courseIndex,
                                },
                              ),
                            });
                            _model.newCirProfile =
                                CourseCurriculumRecord.getDocumentFromData({
                              ...createCourseCurriculumRecordData(
                                userRef: currentUserReference,
                              ),
                              ...mapToFirestore(
                                {
                                  'curr_index':
                                      _model.curriIndexProfile?.courseIndex,
                                },
                              ),
                            }, courseCurriculumRecordReference);
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().coursecurriculumRef =
                                _model.newCirProfile?.reference;
                          }

                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().currindex = _model
                              .curriIndexProfile!.courseIndex
                              .toList()
                              .cast<String>();
                          FFAppState().update(() {});
                          if (widget.frompage == 'edit') {
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed('auth_2_Profile');

                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '已更新您的學校與系所',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 2450),
                                backgroundColor: const Color(0xFF42BAF1),
                              ),
                            );
                          } else {
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                          }
                        } else {
                          logFirebaseEvent('Button_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const SizedBox(
                                  height: 120.0,
                                  child: ShowSelectdepWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          logFirebaseEvent('Button_wait__delay');
                          await Future.delayed(
                              const Duration(milliseconds: 1500));
                        }

                        logFirebaseEvent('Button_firestore_query');
                        _model.locDodList = await querySchoolLocRecordOnce(
                          queryBuilder: (schoolLocRecord) =>
                              schoolLocRecord.where(
                            'school',
                            isEqualTo: _model.schoolValue,
                          ),
                        );
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().ListofLocationDocRef = _model.locDodList!
                            .map((e) => e.reference)
                            .toList()
                            .cast<DocumentReference>();
                        setState(() {});

                        setState(() {});
                      },
                      text: '確認',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
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
      ),
    );
  }
}
