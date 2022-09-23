import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';

class TodoBodyProvider extends ChangeNotifier {
  final tasksDao = AppDatabase.getInstance().tasksDao;

  Future<void> deleteTask(Task task) async {
    await tasksDao.deleteTask(task);
  }

  Future<void> changeTaskCheck(Task task, bool? check) async {
    await tasksDao.updateTask(task: task, check: check);
  }
}

final todoBodyProvider = ChangeNotifierProvider((ref) {
  return TodoBodyProvider();
});

final tasksProvider = StreamProvider.family((ref, TaskList taskList) {
  final tasksDao = AppDatabase.getInstance().tasksDao;
  return tasksDao.watchTaskFromList(taskList);
});
