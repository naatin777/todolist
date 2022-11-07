import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/repositories/current_list_repository_impl.dart';
import 'package:todolist/data/repositories/task_list_repository_impl.dart';

class TaskListNavigationProvider extends StateNotifier<TaskList> {
  TaskListNavigationProvider({required TaskList taskList}) : super(taskList);

  final _currentListRepository = CurrentListRepositoryImpl();
  final _taskListRepository = TaskListRepositoryImpl();

  static Future<TaskList> initialize() async {
    final currentListRepository = CurrentListRepositoryImpl();
    final taskListRepository = TaskListRepositoryImpl();
    final currentListId = await currentListRepository.getCurrentList();
    final currentList = await taskListRepository.getTaskList(currentListId);
    return currentList;
  }

  Future<void> changeTaskListFromId(String taskList) async {
    if (state.id != taskList) {
      try {
        state = (await _taskListRepository.getTaskList(taskList));
      } catch (e) {
        state = inbox;
      }
      _currentListRepository.setCurrentList(state);
    }
  }
}

final taskListNavigationProviderFamily = StateNotifierProvider.family<
    TaskListNavigationProvider, TaskList, TaskList>((ref, arg) {
  return TaskListNavigationProvider(taskList: arg);
});

final taskListNavigationProvider =
    StateNotifierProvider<TaskListNavigationProvider, TaskList>((ref) {
  return throw UnimplementedError();
});
