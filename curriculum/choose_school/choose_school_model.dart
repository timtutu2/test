import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'choose_school_widget.dart' show ChooseSchoolWidget;
import 'package:flutter/material.dart';

class ChooseSchoolModel extends FlutterFlowModel<ChooseSchoolWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - defineUschoolindex] action in IconButton widget.
  int? outputindex;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseIndexListRecord? courseIndex;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CourseCurriculumRecord? courseCurri;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CourseCurriculumRecord? newCirPop;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
