import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editchatphotopage_widget.dart' show EditchatphotopageWidget;
import 'package:flutter/material.dart';

class EditchatphotopageModel extends FlutterFlowModel<EditchatphotopageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getDocReffromchat] action in IconButton widget.
  ChatsRecord? outchat;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  NthuCoursesRecord? courseCoToChat;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
