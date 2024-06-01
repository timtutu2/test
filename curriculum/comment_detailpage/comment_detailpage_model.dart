import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_detailpage_widget.dart' show CommentDetailpageWidget;
import 'package:flutter/material.dart';

class CommentDetailpageModel extends FlutterFlowModel<CommentDetailpageWidget> {
  ///  Local state fields for this page.

  bool showCourseInfo = true;

  List<CommentRecord> commentlist = [];
  void addToCommentlist(CommentRecord item) => commentlist.add(item);
  void removeFromCommentlist(CommentRecord item) => commentlist.remove(item);
  void removeAtIndexFromCommentlist(int index) => commentlist.removeAt(index);
  void insertAtIndexInCommentlist(int index, CommentRecord item) =>
      commentlist.insert(index, item);
  void updateCommentlistAtIndex(int index, Function(CommentRecord) updateFn) =>
      commentlist[index] = updateFn(commentlist[index]);

  bool showdetail = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for chillinteract widget.
  double? chillinteractValue;
  // State field(s) for hardinteract widget.
  double? hardinteractValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CommentRecord? newCommentWithScore;
  // Stores action output result for [Custom Action - commentChangeOrder] action in IconButton widget.
  List<DocumentReference>? allCommentWithOrder;
  // Stores action output result for [Custom Action - commentChangeOrder] action in IconButton widget.
  List<DocumentReference>? allCommentWithOrderNew;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<UsersRecord>? userincourse;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
