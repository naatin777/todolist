import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';

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
