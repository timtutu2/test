import '/account_profile/create_profile/create_profile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth2_create_profile_widget.dart' show Auth2CreateProfileWidget;
import 'package:flutter/material.dart';

class Auth2CreateProfileModel
    extends FlutterFlowModel<Auth2CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for createProfile component.
  late CreateProfileModel createProfileModel;

  @override
  void initState(BuildContext context) {
    createProfileModel = createModel(context, () => CreateProfileModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    createProfileModel.dispose();
  }
}
