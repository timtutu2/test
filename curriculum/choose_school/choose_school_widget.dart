import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'choose_school_model.dart';
export 'choose_school_model.dart';

class ChooseSchoolWidget extends StatefulWidget {
  const ChooseSchoolWidget({super.key});

  @override
  State<ChooseSchoolWidget> createState() => _ChooseSchoolWidgetState();
}

class _ChooseSchoolWidgetState extends State<ChooseSchoolWidget> {
  late ChooseSchoolModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseSchoolModel());
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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '選取您的學校',
              textAlign: TextAlign.justify,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'YuPearl',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(null),
                    options: const ['國立清華大學', '國立陽明交通大學'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue = val),
                    width: 300.0,
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
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'YuPearl',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    hintText: '選擇您的學校',
                    searchHintText: '搜尋您的ㄚ',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: true,
                    isMultiSelect: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.check_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'CHOOSE_SCHOOL_check_outlined_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        school: _model.dropDownValue,
                      ));
                      logFirebaseEvent('IconButton_custom_action');
                      _model.outputindex = await actions.defineUschoolindex(
                        _model.dropDownValue!,
                      );
                      logFirebaseEvent('IconButton_firestore_query');
                      _model.courseIndex = await queryCourseIndexListRecordOnce(
                        queryBuilder: (courseIndexListRecord) =>
                            courseIndexListRecord.where(
                          'index',
                          isEqualTo: _model.outputindex,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      logFirebaseEvent('IconButton_firestore_query');
                      _model.courseCurri =
                          await queryCourseCurriculumRecordOnce(
                        queryBuilder: (courseCurriculumRecord) =>
                            courseCurriculumRecord.where(
                          'user_ref',
                          isEqualTo: currentUserReference,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (_model.courseCurri != null) {
                        logFirebaseEvent('IconButton_backend_call');

                        await _model.courseCurri!.reference.update({
                          ...mapToFirestore(
                            {
                              'curr_index': _model.courseIndex?.courseIndex,
                            },
                          ),
                        });
                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().currindex = _model.courseIndex!.courseIndex
                            .toList()
                            .cast<String>();
                        _model.updatePage(() {});
                      } else {
                        logFirebaseEvent('IconButton_backend_call');

                        var courseCurriculumRecordReference =
                            CourseCurriculumRecord.collection.doc();
                        await courseCurriculumRecordReference.set({
                          ...createCourseCurriculumRecordData(
                            userRef: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'curr_index': _model.courseIndex?.courseIndex,
                            },
                          ),
                        });
                        _model.newCirPop =
                            CourseCurriculumRecord.getDocumentFromData({
                          ...createCourseCurriculumRecordData(
                            userRef: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'curr_index': _model.courseIndex?.courseIndex,
                            },
                          ),
                        }, courseCurriculumRecordReference);
                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().coursecurriculumRef =
                            _model.newCirPop?.reference;
                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().currindex = _model.courseIndex!.courseIndex
                            .toList()
                            .cast<String>();
                        _model.updatePage(() {});
                      }

                      setState(() {});
                    },
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
