import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detailinvitepage_widget.dart' show DetailinvitepageWidget;
import 'package:flutter/material.dart';

class DetailinvitepageModel extends FlutterFlowModel<DetailinvitepageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> first2user = [];
  void addToFirst2user(DocumentReference item) => first2user.add(item);
  void removeFromFirst2user(DocumentReference item) => first2user.remove(item);
  void removeAtIndexFromFirst2user(int index) => first2user.removeAt(index);
  void insertAtIndexInFirst2user(int index, DocumentReference item) =>
      first2user.insert(index, item);
  void updateFirst2userAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      first2user[index] = updateFn(first2user[index]);

  bool declineshow = false;

  bool showremoverecord = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvAskListRecord? photoQueryinv;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? queryfromIDchat;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvAskListRecord? photoQueryinvChangepeople;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? queryfromIDchatChangepeople;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvAskListRecord? photoQueryinvNopeoplechange;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? queryfromIDchatNopeoplechange;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatInvite;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvAskListRecord? nophotoQueryinv;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvAskListRecord? nophotoQueryinvPeoplechange;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  InvAskListRecord? nophotoQueryinvNopeoplechange;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  InvAskListRecord? queryinv;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  InvAskListRecord? queryinvdelete;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
