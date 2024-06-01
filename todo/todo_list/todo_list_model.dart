import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'todo_list_widget.dart' show TodoListWidget;
import 'package:flutter/material.dart';

class TodoListModel extends FlutterFlowModel<TodoListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _tasksManager = StreamRequestManager<List<TasksRecord>>();
  Stream<List<TasksRecord>> tasks({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TasksRecord>> Function() requestFn,
  }) =>
      _tasksManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTasksCache() => _tasksManager.clear();
  void clearTasksCacheKey(String? uniqueKey) =>
      _tasksManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearTasksCache();
  }
}
