import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat2_main_widget.dart' show Chat2MainWidget;
import 'package:flutter/material.dart';

class Chat2MainModel extends FlutterFlowModel<Chat2MainWidget> {
  ///  Local state fields for this page.

  int? tempNum = 99999;

  int tempnumforchat = 0;

  int tempnumforleave = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - comparetwolist] action in chat_2_main widget.
  List<DocumentReference>? diffcourseout;
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in chat_2_main widget.
  NthuCoursesRecord? leavecourse;
  // Stores action output result for [Custom Action - getDocReffromchat] action in chat_2_main widget.
  ChatsRecord? chathavetoLeave;
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in chat_2_main widget.
  NthuCoursesRecord? nthudoc;
  // Stores action output result for [Backend Call - Create Document] action in chat_2_main widget.
  ChatsRecord? newChatCourseNoPhoto;
  // Stores action output result for [Custom Action - getDocReffromchat] action in chat_2_main widget.
  ChatsRecord? queryChatdocExist;
  // Stores action output result for [Custom Action - versioncheck] action in chat_2_main widget.
  String? versionGet;
  // Stores action output result for [Firestore Query - Query a collection] action in chat_2_main widget.
  VersionCheckRecord? versionLastest;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
