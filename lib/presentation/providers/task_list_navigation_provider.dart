import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/repositories/current_list_repository_impl.dart';
import 'package:todolist/data/repositories/task_list_repository_impl.dart';

class TaskListNavigationProvider extends StateNotifier<TaskList> {
  TaskListNavigationProvider(TaskList taskList) : super(taskList);

  final _currentListRepository = CurrentListRepositoryImpl();
  final _taskListRepository = TaskListRepositoryImpl();

  static Future<TaskList> initialize() async {
    final currentListRepository = CurrentListRepositoryImpl();
    final taskListRepository = TaskListRepositoryImpl();
    final currentListId = await currentListRepository.getCurrentList();
    final currentList = await taskListRepository.getTaskList(currentListId);
    return currentList;
  }

  Future<void> changeTaskList(TaskList taskList) async {
    await _currentListRepository.setCurrentList(taskList);
    state = taskList;
  }

  Future<void> addTaskList(String title) async {
    await _taskListRepository.addTaskList(title: title);
  }

  Future<void> removeTaskList(TaskList taskList) async {
    _taskListRepository.removeTaskList(taskList: taskList);
    await changeTaskList(inbox);
  }
}

final taskListsProvider = StreamProvider((ref) {
  final taskListRepository = TaskListRepositoryImpl();
  return taskListRepository.watchAllTaskLists();
});

final taskListNavigationProviderFamily =
    StateNotifierProvider.family<TaskListNavigationProvider, TaskList, TaskList>(
        (ref, arg) {
  return TaskListNavigationProvider(arg);
});

final taskListNavigationProvider =
    StateNotifierProvider<TaskListNavigationProvider, TaskList>((ref) {
  return throw UnimplementedError();
});
