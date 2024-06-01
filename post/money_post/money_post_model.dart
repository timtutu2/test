import '/flutter_flow/flutter_flow_util.dart';
import 'money_post_widget.dart' show MoneyPostWidget;
import 'package:flutter/material.dart';

class MoneyPostModel extends FlutterFlowModel<MoneyPostWidget> {
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
