import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  Local state fields for this component.

  bool showchoseschool = false;

  String tempschool = ' ';

  String tempdep = ' ';

  List<String> depLisrCreat = [];
  void addToDepLisrCreat(String item) => depLisrCreat.add(item);
  void removeFromDepLisrCreat(String item) => depLisrCreat.remove(item);
  void removeAtIndexFromDepLisrCreat(int index) => depLisrCreat.removeAt(index);
  void insertAtIndexInDepLisrCreat(int index, String item) =>
      depLisrCreat.insert(index, item);
  void updateDepLisrCreatAtIndex(int index, Function(String) updateFn) =>
      depLisrCreat[index] = updateFn(depLisrCreat[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  String? _yourNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for dep_School widget.
  FocusNode? depSchoolFocusNode;
  TextEditingController? depSchoolTextController;
  String? Function(BuildContext, String?)? depSchoolTextControllerValidator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for school widget.
  String? schoolValue;
  FormFieldController<String>? schoolValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in school widget.
  SchoolDepartmentRecord? schoolDropdownUpdate;
  // State field(s) for departmentNTHU widget.
  String? departmentNTHUValue;
  FormFieldController<String>? departmentNTHUValueController;
  // Stores action output result for [Custom Action - defineUschoolindex] action in Button widget.
  int? outputindex;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CourseIndexListRecord? curriIndexProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CourseCurriculumRecord? courseCurr;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CourseCurriculumRecord? newCirProfile;

  @override
  void initState(BuildContext context) {
    yourNameTextControllerValidator = _yourNameTextControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    depSchoolFocusNode?.dispose();
    depSchoolTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }
}
