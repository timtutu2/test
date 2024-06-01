import '/flutter_flow/flutter_flow_util.dart';
import 'link_userprofile_widget.dart' show LinkUserprofileWidget;
import 'package:flutter/material.dart';

class LinkUserprofileModel extends FlutterFlowModel<LinkUserprofileWidget> {
  ///  Local state fields for this page.

  bool showmore = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
