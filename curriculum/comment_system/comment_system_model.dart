import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_system_widget.dart' show CommentSystemWidget;
import 'package:flutter/material.dart';

class CommentSystemModel extends FlutterFlowModel<CommentSystemWidget> {
  ///  Local state fields for this component.

  bool showall = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'can\'t be empty';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CommentRecord? newComment;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<UsersRecord>? userjoinclass;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
