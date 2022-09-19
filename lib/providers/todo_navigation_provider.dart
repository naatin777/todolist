import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
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

  Future<void> addTaskList(String title) async {
    final taskListsDao = AppDatabase.getInstance().taskListsDao;
    await taskListsDao.insertTaskList(title);
  }

  Future<void> deleteTaskList(TaskList taskList) async {
    final taskListsDao = AppDatabase.getInstance().taskListsDao;
    await taskListsDao.deleteTaskList(taskList);
    await changeTaskList(inbox);
  }
}

final taskLists = StreamProvider((ref) {
  final taskListsDao = AppDatabase.getInstance().taskListsDao;
  return taskListsDao.watchTaskList();
});

final todoNavigationProviderFamily =
    StateNotifierProvider.family<TodoNavigationProvider, TaskList, TaskList>(
        (ref, arg) {
  return TodoNavigationProvider(arg);
});

final todoNavigationProvider =
    StateNotifierProvider<TodoNavigationProvider, TaskList>((ref) {
  return throw UnimplementedError();
});
