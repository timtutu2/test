import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editchattextpage_widget.dart' show EditchattextpageWidget;
import 'package:flutter/material.dart';

class EditchattextpageModel extends FlutterFlowModel<EditchattextpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  PostRecord? outputpost;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
