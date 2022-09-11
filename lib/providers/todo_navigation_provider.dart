import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/task_list_db.dart';

class TodoNavigationProvider extends StateNotifier<TaskList?> {
  TodoNavigationProvider() : super(null);

  void changeTaskList(TaskList taskList) {
    state = taskList;
  }
}

final todoNavigationProvider =
    StateNotifierProvider<TodoNavigationProvider, TaskList?>((ref) {
  return TodoNavigationProvider();
});
