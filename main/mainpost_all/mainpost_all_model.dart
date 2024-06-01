import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'mainpost_all_widget.dart' show MainpostAllWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainpostAllModel extends FlutterFlowModel<MainpostAllWidget> {
  ///  Local state fields for this page.

  bool showSearchinMainpost = false;

  bool showsharebutton = false;

  DocumentReference? tempPost;

  bool showpostdetail = false;

  bool crossShow = false;

  ChatsRecord? navChatDoc;

  List<DocumentReference> tempuser = [];
  void addToTempuser(DocumentReference item) => tempuser.add(item);
  void removeFromTempuser(DocumentReference item) => tempuser.remove(item);
  void removeAtIndexFromTempuser(int index) => tempuser.removeAt(index);
  void insertAtIndexInTempuser(int index, DocumentReference item) =>
      tempuser.insert(index, item);
  void updateTempuserAtIndex(int index, Function(DocumentReference) updateFn) =>
      tempuser[index] = updateFn(tempuser[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - freshCacheTime] action in mainpost_all widget.
  bool? isoverride;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<PostRecord> simpleSearchResults = [];
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, PostRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  Completer<int>? firestoreRequestCompleter;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? postchat2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatsecselectsec;
  // Stores action output result for [Custom Action - ifdofisexistUser] action in user_name widget.
  bool? existuserall;
  // Stores action output result for [Custom Action - getDocReffromchat] action in Button widget.
  ChatsRecord? chatdocsecSearchselectsec;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatsecSearchselectsec;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, PostRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, PostRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
