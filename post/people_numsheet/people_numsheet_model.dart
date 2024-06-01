import '/flutter_flow/flutter_flow_util.dart';
import 'people_numsheet_widget.dart' show PeopleNumsheetWidget;
import 'package:flutter/material.dart';

class PeopleNumsheetModel extends FlutterFlowModel<PeopleNumsheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
