import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'testpage_widget.dart' show TestpageWidget;
import 'package:flutter/material.dart';

class TestpageModel extends FlutterFlowModel<TestpageWidget> {
  ///  Local state fields for this page.

  int? temp;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDowndep widget.
  String? dropDowndepValue;
  FormFieldController<String>? dropDowndepValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
