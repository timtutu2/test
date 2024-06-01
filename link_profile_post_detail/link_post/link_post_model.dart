import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'link_post_widget.dart' show LinkPostWidget;
import 'package:flutter/material.dart';

class LinkPostModel extends FlutterFlowModel<LinkPostWidget> {
  ///  Local state fields for this page.

  bool iscollection = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - removedatetype] action in Container widget.
  List<PostWithTimeStruct>? outputCollectionList;
  // Stores action output result for [Custom Action - getDocReffromchat] action in Button widget.
  ChatsRecord? chatdocdetail;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatdetail;
  // Stores action output result for [Custom Action - getDocReffromchat] action in Button widget.
  ChatsRecord? chatdocdetail2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatdetail2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
