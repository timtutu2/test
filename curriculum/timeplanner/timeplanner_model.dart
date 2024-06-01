import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import 'timeplanner_widget.dart' show TimeplannerWidget;
import 'package:flutter/material.dart';

class TimeplannerModel extends FlutterFlowModel<TimeplannerWidget> {
  ///  Local state fields for this page.

  List<NthuCoursesRecord> courseDocs = [];
  void addToCourseDocs(NthuCoursesRecord item) => courseDocs.add(item);
  void removeFromCourseDocs(NthuCoursesRecord item) => courseDocs.remove(item);
  void removeAtIndexFromCourseDocs(int index) => courseDocs.removeAt(index);
  void insertAtIndexInCourseDocs(int index, NthuCoursesRecord item) =>
      courseDocs.insert(index, item);
  void updateCourseDocsAtIndex(
          int index, Function(NthuCoursesRecord) updateFn) =>
      courseDocs[index] = updateFn(courseDocs[index]);

  bool addTaskMode = false;

  List<CustomColorStruct> customColor = [];
  void addToCustomColor(CustomColorStruct item) => customColor.add(item);
  void removeFromCustomColor(CustomColorStruct item) =>
      customColor.remove(item);
  void removeAtIndexFromCustomColor(int index) => customColor.removeAt(index);
  void insertAtIndexInCustomColor(int index, CustomColorStruct item) =>
      customColor.insert(index, item);
  void updateCustomColorAtIndex(
          int index, Function(CustomColorStruct) updateFn) =>
      customColor[index] = updateFn(customColor[index]);

  bool meaningless = false;

  String tempcolor = '0xFFFFFFFF';

  int tempforloop = 1;

  bool schoolchosed = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in timeplanner widget.
  CourseCurriculumRecord? userCoursesRef;
  // Stores action output result for [Custom Action - covertDocRefsToDocs] action in timeplanner widget.
  List<NthuCoursesRecord>? coursedocs;
  // Stores action output result for [Backend Call - Create Document] action in timeplanner widget.
  CourseCurriculumRecord? newCir;
  // Stores action output result for [Custom Action - versioncheck] action in timeplanner widget.
  String? versionGet;
  // Stores action output result for [Firestore Query - Query a collection] action in timeplanner widget.
  VersionCheckRecord? versionLastest;
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseCurriculumRecord? exist;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseIndexListRecord? outputNTHUcourseindex;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CourseCurriculumRecord? newCirbuttom;
  // Stores action output result for [Bottom Sheet - selectcourses] action in IconButton widget.
  List<NthuCoursesRecord>? bottomreturn;
  // Stores action output result for [Custom Action - flutterColorpac] action in Container widget.
  Color? outputcolor;
  // Stores action output result for [Custom Action - getCustomColorspecificoption] action in Container widget.
  CustomColorStruct? outputcustomcolor;
  // Stores action output result for [Custom Action - finditemiDocsaction] action in Container widget.
  NthuCoursesRecord? changedoc;
  // Stores action output result for [Custom Action - turnColortoString] action in Container widget.
  String? colorOutput1;
  // Stores action output result for [Custom Action - turnColortoString] action in Container widget.
  String? colorOutput2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '主題不得為空';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '內容不得為空';
    }

    return null;
  }

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseCurriculumRecord? existNYCU;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseIndexListRecord? outputNYCUcourseindex;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CourseCurriculumRecord? newCirbuttomNYCU;
  // Stores action output result for [Bottom Sheet - selectcourses] action in IconButton widget.
  List<NthuCoursesRecord>? bottomreturnNYCU;
  // Stores action output result for [Custom Action - flutterColorpac] action in Container widget.
  Color? outputcolorNYCU;
  // Stores action output result for [Custom Action - getCustomColorspecificoption] action in Container widget.
  CustomColorStruct? outputcustomcolorNYCU;
  // Stores action output result for [Custom Action - finditemiDocsaction] action in Container widget.
  NthuCoursesRecord? changedocNYCU;
  // Stores action output result for [Custom Action - turnColortoString] action in Container widget.
  String? colorOutput1NYCU;
  // Stores action output result for [Custom Action - turnColortoString] action in Container widget.
  String? colorOutput2NYCU;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '主題不得為空';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '內容不得為空';
    }

    return null;
  }

  // Stores action output result for [Custom Action - defineUschoolindex] action in IconButton widget.
  int? outputindex;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseIndexListRecord? courseIndexList;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseCurriculumRecord? courseCurri;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CourseCurriculumRecord? newCirPop;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Query cache managers for this widget.

  final _todolistManager = StreamRequestManager<List<TasksRecord>>();
  Stream<List<TasksRecord>> todolist({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TasksRecord>> Function() requestFn,
  }) =>
      _todolistManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTodolistCache() => _todolistManager.clear();
  void clearTodolistCacheKey(String? uniqueKey) =>
      _todolistManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController1?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    tabBarController2?.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    /// Dispose query cache managers for this widget.

    clearTodolistCache();
  }
}
