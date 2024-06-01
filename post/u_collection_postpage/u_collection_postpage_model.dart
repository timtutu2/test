import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'u_collection_postpage_widget.dart' show UCollectionPostpageWidget;
import 'package:flutter/material.dart';

class UCollectionPostpageModel
    extends FlutterFlowModel<UCollectionPostpageWidget> {
  ///  Local state fields for this page.

  bool showSearchaction = false;

  bool showSharebottom = false;

  DocumentReference? tempclickPost;

  List<PostRecord> tempLovelist = [];
  void addToTempLovelist(PostRecord item) => tempLovelist.add(item);
  void removeFromTempLovelist(PostRecord item) => tempLovelist.remove(item);
  void removeAtIndexFromTempLovelist(int index) => tempLovelist.removeAt(index);
  void insertAtIndexInTempLovelist(int index, PostRecord item) =>
      tempLovelist.insert(index, item);
  void updateTempLovelistAtIndex(int index, Function(PostRecord) updateFn) =>
      tempLovelist[index] = updateFn(tempLovelist[index]);

  int tempnum = 0;

  int? tempnumber = 0;

  List<PostWithTimeStruct> dontneedDeleteRef = [];
  void addToDontneedDeleteRef(PostWithTimeStruct item) =>
      dontneedDeleteRef.add(item);
  void removeFromDontneedDeleteRef(PostWithTimeStruct item) =>
      dontneedDeleteRef.remove(item);
  void removeAtIndexFromDontneedDeleteRef(int index) =>
      dontneedDeleteRef.removeAt(index);
  void insertAtIndexInDontneedDeleteRef(int index, PostWithTimeStruct item) =>
      dontneedDeleteRef.insert(index, item);
  void updateDontneedDeleteRefAtIndex(
          int index, Function(PostWithTimeStruct) updateFn) =>
      dontneedDeleteRef[index] = updateFn(dontneedDeleteRef[index]);

  List<DocumentReference> dontneeddeletepost = [];
  void addToDontneeddeletepost(DocumentReference item) =>
      dontneeddeletepost.add(item);
  void removeFromDontneeddeletepost(DocumentReference item) =>
      dontneeddeletepost.remove(item);
  void removeAtIndexFromDontneeddeletepost(int index) =>
      dontneeddeletepost.removeAt(index);
  void insertAtIndexInDontneeddeletepost(int index, DocumentReference item) =>
      dontneeddeletepost.insert(index, item);
  void updateDontneeddeletepostAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      dontneeddeletepost[index] = updateFn(dontneeddeletepost[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - reverseAction] action in uCollectionPostpage widget.
  List<PostWithTimeStruct>? postCollectionReverse;
  // Stores action output result for [Custom Action - ifdofisexistPost] action in uCollectionPostpage widget.
  bool? exist;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<PostRecord>? postquery;
  List<PostRecord> simpleSearchResults = [];
  // Stores action output result for [Custom Action - getDocReffromchat] action in Button widget.
  ChatsRecord? chatdocucollect;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatucollect;
  // Stores action output result for [Custom Action - getDocReffromchat] action in Button widget.
  ChatsRecord? chatdocucollect2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatucollect2;
  // Stores action output result for [Custom Action - getDocReffromchat] action in Button widget.
  ChatsRecord? chatdoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChat;
  // Stores action output result for [Custom Action - getDocReffromchat] action in Button widget.
  ChatsRecord? chatdocucollectSearch;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatucollectSearch;
  // Stores action output result for [Custom Action - removedatetype] action in Button widget.
  List<PostWithTimeStruct>? postNewCollection;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
