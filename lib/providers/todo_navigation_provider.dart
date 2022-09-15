import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/prefs/todo_navigation_prefs.dart';

class TodoNavigationProvider extends StateNotifier<TaskList> {
  TodoNavigationProvider(TaskList taskList) : super(taskList);

  static Future<TaskList> initialize() async {
    final todoNavigationPrefs = TodoNavigationPrefs();
    final appDatabase = AppDatabase.getInstance();
    final todoNavigation = await todoNavigationPrefs.loadTodoNavigation();
    return appDatabase.taskListsDao.selectFromId(todoNavigation);
  }

  Future<void> changeTaskList(TaskList taskList) async {
    final todoNavigationPrefs = TodoNavigationPrefs();
    await todoNavigationPrefs.saveTodoNavigation(taskList);
    state = taskList;
  }
}

final todoNavigationProviderFamily =
    StateNotifierProvider.family<TodoNavigationProvider, TaskList, TaskList>(
        (ref, arg) {
  return TodoNavigationProvider(arg);
});

final todoNavigationProvider =
    StateNotifierProvider<TodoNavigationProvider, TaskList>((ref) {
  return throw UnimplementedError();
});
