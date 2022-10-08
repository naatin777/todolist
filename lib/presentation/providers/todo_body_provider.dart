import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/repositories/task_repository_impl.dart';

class TodoBodyProvider extends ChangeNotifier {
  final taskListRepository = TaskRepositoryImpl();

  Future<void> removeTask(Task task) async {
    await taskListRepository.removeTask(task);
  }

  Future<void> changeTaskCheck(Task task, bool? check) async {
    await taskListRepository.updateTask(task: task, check: check);
  }
}

final todoBodyProvider = ChangeNotifierProvider((ref) {
  return TodoBodyProvider();
});

final tasksProvider = StreamProvider.family.autoDispose((ref, TaskList taskList) {
  final taskListRepository = TaskRepositoryImpl();
  return taskListRepository.watchTasksFromTaskList(taskList);
});
