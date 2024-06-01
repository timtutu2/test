import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth2_profile_widget.dart' show Auth2ProfileWidget;
import 'package:flutter/material.dart';

class Auth2ProfileModel extends FlutterFlowModel<Auth2ProfileWidget> {
  ///  Local state fields for this page.

  bool deleteaccount = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - versioncheck] action in auth_2_Profile widget.
  String? versionGet;
  // Stores action output result for [Firestore Query - Query a collection] action in auth_2_Profile widget.
  VersionCheckRecord? versionLastest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
