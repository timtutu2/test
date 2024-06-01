import '/flutter_flow/flutter_flow_util.dart';
import 'blankpage_widget.dart' show BlankpageWidget;
import 'package:flutter/material.dart';

class BlankpageModel extends FlutterFlowModel<BlankpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
