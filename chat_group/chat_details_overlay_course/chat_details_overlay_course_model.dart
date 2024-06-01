import '/chat_group/delete_dialog_course/delete_dialog_course_widget.dart';
import '/chat_group/user_list_small/user_list_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_details_overlay_course_widget.dart'
    show ChatDetailsOverlayCourseWidget;
import 'package:flutter/material.dart';

class ChatDetailsOverlayCourseModel
    extends FlutterFlowModel<ChatDetailsOverlayCourseWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for user_ListSmall dynamic component.
  late FlutterFlowDynamicModels<UserListSmallModel> userListSmallModels;
  // Model for deleteDialog_course component.
  late DeleteDialogCourseModel deleteDialogCourseModel;

  @override
  void initState(BuildContext context) {
    userListSmallModels = FlutterFlowDynamicModels(() => UserListSmallModel());
    deleteDialogCourseModel =
        createModel(context, () => DeleteDialogCourseModel());
  }

  @override
  void dispose() {
    userListSmallModels.dispose();
    deleteDialogCourseModel.dispose();
  }
}
