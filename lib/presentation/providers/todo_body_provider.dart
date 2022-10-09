import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/repositories/task_repository_impl.dart';

class TodoBodyProvider extends StateNotifier<void> {
  TodoBodyProvider() : super(null);

  final taskListRepository = TaskRepositoryImpl();

  Future<void> removeTask(Task task) async {
    await taskListRepository.removeTask(task);
  }

  Future<void> changeTaskCheck(Task task, bool? check) async {
    await taskListRepository.updateTask(task: task, check: check);
  }
}

final todoBodyProvider = StateNotifierProvider<TodoBodyProvider, void>((ref) {
  return TodoBodyProvider();
});

final tasksProvider =
    StreamProvider.family.autoDispose((ref, TaskList taskList) {
  final taskListRepository = TaskRepositoryImpl();
  return taskListRepository.watchTasksFromTaskList(taskList);
});
