import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'postpage_widget.dart' show PostpageWidget;
import 'package:flutter/material.dart';

class PostpageModel extends FlutterFlowModel<PostpageWidget> {
  ///  Local state fields for this page.

  List<String> imageuploaded = [];
  void addToImageuploaded(String item) => imageuploaded.add(item);
  void removeFromImageuploaded(String item) => imageuploaded.remove(item);
  void removeAtIndexFromImageuploaded(int index) =>
      imageuploaded.removeAt(index);
  void insertAtIndexInImageuploaded(int index, String item) =>
      imageuploaded.insert(index, item);
  void updateImageuploadedAtIndex(int index, Function(String) updateFn) =>
      imageuploaded[index] = updateFn(imageuploaded[index]);

  bool showchoosepage = false;

  DocumentReference? coursechosed;

  bool showpeoplenum = false;

  int? tempPeopleNum;

  String? tempmoney;

  bool showmoney = false;

  bool showsearch = false;

  bool showCategory = false;

  String temppostcate = ' ';

  bool showCourseConfirm = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - versioncheck] action in postpage widget.
  String? versionGet;
  // Stores action output result for [Firestore Query - Query a collection] action in postpage widget.
  VersionCheckRecord? versionLastest;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '內容不得為空';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextFieldpeople widget.
  FocusNode? textFieldpeopleFocusNode;
  TextEditingController? textFieldpeopleTextController;
  String? Function(BuildContext, String?)?
      textFieldpeopleTextControllerValidator;
  String? _textFieldpeopleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '需要大於0';
    }

    if (val.isEmpty) {
      return '需要大於0';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PostRecord>? outputpostPhoto;
  // Stores action output result for [Custom Action - noRepeatInt] action in Button widget.
  int? outInt;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? newCreatePost;
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in Button widget.
  NthuCoursesRecord? docfromcoursechosed;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? newCreatePostEmpty;
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in Button widget.
  NthuCoursesRecord? docfromcoursechosedEmpty;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PostRecord>? outputpostno;
  // Stores action output result for [Custom Action - noRepeatInt] action in Button widget.
  int? outint;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? newCreatePostNophoto;
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in Button widget.
  NthuCoursesRecord? docfromcoursechosedNophoto;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? newCreatePostNophotoNew;
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in Button widget.
  NthuCoursesRecord? docfromcoursechosedNophotoNew;
  // State field(s) for chatpost widget.
  FocusNode? chatpostFocusNode;
  TextEditingController? chatpostTextController;
  String? Function(BuildContext, String?)? chatpostTextControllerValidator;
  String? _chatpostTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '聊天室名稱不得為空';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for need-supply widget.
  bool? needSupplyValue;
  // State field(s) for TextFieldsearch widget.
  final textFieldsearchKey = GlobalKey();
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? textFieldsearchSelectedOption;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<NthuCoursesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textFieldpeopleTextControllerValidator =
        _textFieldpeopleTextControllerValidator;
    chatpostTextControllerValidator = _chatpostTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldpeopleFocusNode?.dispose();
    textFieldpeopleTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    chatpostFocusNode?.dispose();
    chatpostTextController?.dispose();

    textFieldsearchFocusNode?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
