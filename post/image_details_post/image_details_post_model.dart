import '/flutter_flow/flutter_flow_util.dart';
import 'image_details_post_widget.dart' show ImageDetailsPostWidget;
import 'package:flutter/material.dart';

class ImageDetailsPostModel extends FlutterFlowModel<ImageDetailsPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
