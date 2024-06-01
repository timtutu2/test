import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dep_school_choose_widget.dart' show DepSchoolChooseWidget;
import 'package:flutter/material.dart';

class DepSchoolChooseModel extends FlutterFlowModel<DepSchoolChooseWidget> {
  ///  Local state fields for this component.

  List<String> deplist = [];
  void addToDeplist(String item) => deplist.add(item);
  void removeFromDeplist(String item) => deplist.remove(item);
  void removeAtIndexFromDeplist(int index) => deplist.removeAt(index);
  void insertAtIndexInDeplist(int index, String item) =>
      deplist.insert(index, item);
  void updateDeplistAtIndex(int index, Function(String) updateFn) =>
      deplist[index] = updateFn(deplist[index]);

  bool depinitialset = true;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in dep_school_choose widget.
  SchoolDepartmentRecord? schoolDep;
  // Stores action output result for [Firestore Query - Query a collection] action in dep_school_choose widget.
  SchoolDepartmentRecord? schoolDepDafault;
  // State field(s) for school widget.
  String? schoolValue;
  FormFieldController<String>? schoolValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in school widget.
  SchoolDepartmentRecord? schoolDropdownUpdate;
  // State field(s) for departmentNTHU widget.
  String? departmentNTHUValue;
  FormFieldController<String>? departmentNTHUValueController;
  // Stores action output result for [Custom Action - defineUschoolindex] action in Button widget.
  int? outputindex;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CourseIndexListRecord? curriIndexProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CourseCurriculumRecord? courseCurr;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CourseCurriculumRecord? newCirProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SchoolLocRecord>? locDodList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
