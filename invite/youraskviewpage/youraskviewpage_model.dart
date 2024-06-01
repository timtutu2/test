import '/flutter_flow/flutter_flow_util.dart';
import 'youraskviewpage_widget.dart' show YouraskviewpageWidget;
import 'package:flutter/material.dart';

class YouraskviewpageModel extends FlutterFlowModel<YouraskviewpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - ifdofisexistUser] action in Text widget.
  bool? existuser;
  // Stores action output result for [Custom Action - ifdofisexistPost] action in Button widget.
  bool? existpostCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
