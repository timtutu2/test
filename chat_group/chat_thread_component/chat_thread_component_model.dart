import '/backend/backend.dart';
import '/chat_group/chat_thread_update/chat_thread_update_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_thread_component_widget.dart' show ChatThreadComponentWidget;
import 'package:flutter/material.dart';

class ChatThreadComponentModel
    extends FlutterFlowModel<ChatThreadComponentWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> lastSeenBy = [];
  void addToLastSeenBy(DocumentReference item) => lastSeenBy.add(item);
  void removeFromLastSeenBy(DocumentReference item) => lastSeenBy.remove(item);
  void removeAtIndexFromLastSeenBy(int index) => lastSeenBy.removeAt(index);
  void insertAtIndexInLastSeenBy(int index, DocumentReference item) =>
      lastSeenBy.insert(index, item);
  void updateLastSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastSeenBy[index] = updateFn(lastSeenBy[index]);

  List<FFUploadedFile> imagesUploaded = [];
  void addToImagesUploaded(FFUploadedFile item) => imagesUploaded.add(item);
  void removeFromImagesUploaded(FFUploadedFile item) =>
      imagesUploaded.remove(item);
  void removeAtIndexFromImagesUploaded(int index) =>
      imagesUploaded.removeAt(index);
  void insertAtIndexInImagesUploaded(int index, FFUploadedFile item) =>
      imagesUploaded.insert(index, item);
  void updateImagesUploadedAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      imagesUploaded[index] = updateFn(imagesUploaded[index]);

  bool uploadfield = false;

  int? uploadimagecount = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  List<ChatMessagesRecord>? listViewPreviousSnapshot;
  // Models for chat_threadUpdate dynamic component.
  late FlutterFlowDynamicModels<ChatThreadUpdateModel> chatThreadUpdateModels;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  // State field(s) for TextFieldsend widget.
  FocusNode? textFieldsendFocusNode;
  TextEditingController? textFieldsendTextController;
  String? Function(BuildContext, String?)? textFieldsendTextControllerValidator;
  String? _textFieldsendTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '訊息不得為空';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newChatonlyimage;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newChattext;

  @override
  void initState(BuildContext context) {
    chatThreadUpdateModels =
        FlutterFlowDynamicModels(() => ChatThreadUpdateModel());
    textFieldsendTextControllerValidator =
        _textFieldsendTextControllerValidator;
  }

  @override
  void dispose() {
    chatThreadUpdateModels.dispose();
    textFieldsendFocusNode?.dispose();
    textFieldsendTextController?.dispose();
  }
}
