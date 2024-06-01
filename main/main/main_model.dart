import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'main_widget.dart' show MainWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  Local state fields for this page.

  bool showsharesetting = false;

  bool showjoinmakesurebar = false;

  int? tempstatus = 2;

  DocumentReference? tempinvbuttomdecide;

  bool showsearch = false;

  DocumentReference? tempClickSharebottom;

  bool hideYourCourse = false;

  bool showpostdetail = false;

  bool tempcourseCategoarychosed = false;

  bool showselectdepartment = false;

  List<DocumentReference> noncourse = [];
  void addToNoncourse(DocumentReference item) => noncourse.add(item);
  void removeFromNoncourse(DocumentReference item) => noncourse.remove(item);
  void removeAtIndexFromNoncourse(int index) => noncourse.removeAt(index);
  void insertAtIndexInNoncourse(int index, DocumentReference item) =>
      noncourse.insert(index, item);
  void updateNoncourseAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      noncourse[index] = updateFn(noncourse[index]);

  bool showfilter = false;

  String? version;

  List<String> courseDepList = [];
  void addToCourseDepList(String item) => courseDepList.add(item);
  void removeFromCourseDepList(String item) => courseDepList.remove(item);
  void removeAtIndexFromCourseDepList(int index) =>
      courseDepList.removeAt(index);
  void insertAtIndexInCourseDepList(int index, String item) =>
      courseDepList.insert(index, item);
  void updateCourseDepListAtIndex(int index, Function(String) updateFn) =>
      courseDepList[index] = updateFn(courseDepList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in main widget.
  SchoolDepartmentRecord? coursedeplist;
  // Stores action output result for [Custom Action - versioncheck] action in main widget.
  String? versionGet;
  // Stores action output result for [Firestore Query - Query a collection] action in main widget.
  VersionCheckRecord? versionLastest;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<NthuCoursesRecord> simpleSearchResults = [];
  // State field(s) for DropDowndep widget.
  String? dropDowndepValue;
  FormFieldController<String>? dropDowndepValueController;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
