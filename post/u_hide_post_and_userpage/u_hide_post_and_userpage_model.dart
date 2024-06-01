import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'u_hide_post_and_userpage_widget.dart' show UHidePostAndUserpageWidget;
import 'package:flutter/material.dart';

class UHidePostAndUserpageModel
    extends FlutterFlowModel<UHidePostAndUserpageWidget> {
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

  DocumentReference? tempclickuser;

  bool showblockuser = false;

  int? tempnumber = 0;

  List<PostWithTimeStruct> dontdeletehide = [];
  void addToDontdeletehide(PostWithTimeStruct item) => dontdeletehide.add(item);
  void removeFromDontdeletehide(PostWithTimeStruct item) =>
      dontdeletehide.remove(item);
  void removeAtIndexFromDontdeletehide(int index) =>
      dontdeletehide.removeAt(index);
  void insertAtIndexInDontdeletehide(int index, PostWithTimeStruct item) =>
      dontdeletehide.insert(index, item);
  void updateDontdeletehideAtIndex(
          int index, Function(PostWithTimeStruct) updateFn) =>
      dontdeletehide[index] = updateFn(dontdeletehide[index]);

  List<DocumentReference> dontdeletehidepost = [];
  void addToDontdeletehidepost(DocumentReference item) =>
      dontdeletehidepost.add(item);
  void removeFromDontdeletehidepost(DocumentReference item) =>
      dontdeletehidepost.remove(item);
  void removeAtIndexFromDontdeletehidepost(int index) =>
      dontdeletehidepost.removeAt(index);
  void insertAtIndexInDontdeletehidepost(int index, DocumentReference item) =>
      dontdeletehidepost.insert(index, item);
  void updateDontdeletehidepostAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      dontdeletehidepost[index] = updateFn(dontdeletehidepost[index]);

  List<DocumentReference> dontdeleteuser = [];
  void addToDontdeleteuser(DocumentReference item) => dontdeleteuser.add(item);
  void removeFromDontdeleteuser(DocumentReference item) =>
      dontdeleteuser.remove(item);
  void removeAtIndexFromDontdeleteuser(int index) =>
      dontdeleteuser.removeAt(index);
  void insertAtIndexInDontdeleteuser(int index, DocumentReference item) =>
      dontdeleteuser.insert(index, item);
  void updateDontdeleteuserAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      dontdeleteuser[index] = updateFn(dontdeleteuser[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - reverseAction] action in uHidePostAndUserpage widget.
  List<PostWithTimeStruct>? hidePostCollectionReverse;
  // Stores action output result for [Custom Action - ifdofisexistPost] action in uHidePostAndUserpage widget.
  bool? exist;
  // Stores action output result for [Custom Action - ifdofisexistUser] action in uHidePostAndUserpage widget.
  bool? existuser;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Custom Action - removedatetype] action in Button widget.
  List<PostWithTimeStruct>? updateHidepost;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
