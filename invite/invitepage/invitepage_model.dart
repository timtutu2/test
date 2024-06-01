import '/flutter_flow/flutter_flow_util.dart';
import 'invitepage_widget.dart' show InvitepageWidget;
import 'package:flutter/material.dart';

class InvitepageModel extends FlutterFlowModel<InvitepageWidget> {
  ///  Local state fields for this page.

  bool localinvitenotifi = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - ifdofisexistUser] action in Text widget.
  bool? existuser;
  // Stores action output result for [Custom Action - ifdofisexistPost] action in Button widget.
  bool? existpost;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
