import 'package:todolist/data/db/app_database.dart';

abstract class TaskListRepository {
  Future<TaskList> getTaskList(String id);
  Future<void> addTaskList({required String title});
  Future<void> removeTaskList({required TaskList taskList});
  Stream<List<TaskList>> watchAllTaskLists();
}
