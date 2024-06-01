import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'selectcourses_widget.dart' show SelectcoursesWidget;
import 'package:flutter/material.dart';

class SelectcoursesModel extends FlutterFlowModel<SelectcoursesWidget> {
  ///  Local state fields for this component.

  int? itemcount = 0;

  int? timecount = 0;

  List<CustomColorStruct> customColorlocal = [];
  void addToCustomColorlocal(CustomColorStruct item) =>
      customColorlocal.add(item);
  void removeFromCustomColorlocal(CustomColorStruct item) =>
      customColorlocal.remove(item);
  void removeAtIndexFromCustomColorlocal(int index) =>
      customColorlocal.removeAt(index);
  void insertAtIndexInCustomColorlocal(int index, CustomColorStruct item) =>
      customColorlocal.insert(index, item);
  void updateCustomColorlocalAtIndex(
          int index, Function(CustomColorStruct) updateFn) =>
      customColorlocal[index] = updateFn(customColorlocal[index]);

  List<NthuCoursesRecord> componentdoc = [];
  void addToComponentdoc(NthuCoursesRecord item) => componentdoc.add(item);
  void removeFromComponentdoc(NthuCoursesRecord item) =>
      componentdoc.remove(item);
  void removeAtIndexFromComponentdoc(int index) => componentdoc.removeAt(index);
  void insertAtIndexInComponentdoc(int index, NthuCoursesRecord item) =>
      componentdoc.insert(index, item);
  void updateComponentdocAtIndex(
          int index, Function(NthuCoursesRecord) updateFn) =>
      componentdoc[index] = updateFn(componentdoc[index]);

  String? compschool;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - turnalldofreftodoe] action in IconButton widget.
  List<NthuCoursesRecord>? outputcourse;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<NthuCoursesRecord> simpleSearchResults = [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    tabBarController?.dispose();
  }
}
