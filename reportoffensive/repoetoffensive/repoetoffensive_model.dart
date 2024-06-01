import '/flutter_flow/flutter_flow_util.dart';
import 'repoetoffensive_widget.dart' show RepoetoffensiveWidget;
import 'package:flutter/material.dart';

class RepoetoffensiveModel extends FlutterFlowModel<RepoetoffensiveWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for report widget.
  FocusNode? reportFocusNode;
  TextEditingController? reportTextController;
  String? Function(BuildContext, String?)? reportTextControllerValidator;
  String? _reportTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '內容不得為空';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    reportTextControllerValidator = _reportTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    reportFocusNode?.dispose();
    reportTextController?.dispose();
  }
}
