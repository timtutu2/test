import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'joinpage_widget.dart' show JoinpageWidget;
import 'package:flutter/material.dart';

class JoinpageModel extends FlutterFlowModel<JoinpageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> can = [];
  void addToCan(DocumentReference item) => can.add(item);
  void removeFromCan(DocumentReference item) => can.remove(item);
  void removeAtIndexFromCan(int index) => can.removeAt(index);
  void insertAtIndexInCan(int index, DocumentReference item) =>
      can.insert(index, item);
  void updateCanAtIndex(int index, Function(DocumentReference) updateFn) =>
      can[index] = updateFn(can[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InviteAskListRecord? joingroupphoto;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

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

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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
