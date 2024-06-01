import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_postpage_widget.dart' show EditPostpageWidget;
import 'package:flutter/material.dart';

class EditPostpageModel extends FlutterFlowModel<EditPostpageWidget> {
  ///  Local state fields for this page.

  bool showdelete = false;

  bool showcourselect = false;

  DocumentReference? editcoursechoosed;

  bool localpoststatus = false;

  bool? showpeoplenum = false;

  bool? showmoney = false;

  int? temppeoplenum;

  String? tempmoney;

  bool showsearch = false;

  bool showChosedCourse = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getDocfromrefNthucourse] action in Button widget.
  NthuCoursesRecord? courseoutput;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Switcpoststatus widget.
  bool? switcpoststatusValue;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  InvAskListRecord? invFromPost;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  InvAskListRecord? invFromPostnochat;
  // State field(s) for TextFieldpeople widget.
  FocusNode? textFieldpeopleFocusNode;
  TextEditingController? textFieldpeopleTextController;
  String? Function(BuildContext, String?)?
      textFieldpeopleTextControllerValidator;
  String? _textFieldpeopleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextFieldsearch widget.
  FocusNode? textFieldsearchFocusNode;
  TextEditingController? textFieldsearchTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchTextControllerValidator;
  List<NthuCoursesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textFieldpeopleTextControllerValidator =
        _textFieldpeopleTextControllerValidator;
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

    textFieldsearchFocusNode?.dispose();
    textFieldsearchTextController?.dispose();
  }
}
