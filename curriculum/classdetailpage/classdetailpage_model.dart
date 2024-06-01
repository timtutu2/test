import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'classdetailpage_widget.dart' show ClassdetailpageWidget;
import 'package:flutter/material.dart';

class ClassdetailpageModel extends FlutterFlowModel<ClassdetailpageWidget> {
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

  double? tempchill;

  double? temphard;

  CommentRecord? userRecord;

  bool showdetail = false;

  int tempnumComment = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in classdetailpage widget.
  NthuCoursesRecord? coursedoc;
  // Stores action output result for [Custom Action - docrefTodocComment] action in classdetailpage widget.
  List<CommentRecord>? commentdoc;
  // Stores action output result for [Custom Action - docrefTodocComment] action in classdetailpage widget.
  List<CommentRecord>? commentdocUserrecord;
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
  // Stores action output result for [Custom Action - commentChangeOrder] action in IconButton widget.
  List<DocumentReference>? outCommentList;
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
