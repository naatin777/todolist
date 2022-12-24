import 'package:todolist/data/db/app_database.dart';

abstract class TaskListRepository {
  Future<List<TaskList>> getAllTaskLists();
  Future<TaskList> getTaskList(String id);
  Stream<List<TaskList>> watchAllTaskLists();
  Stream<TaskList> watchTaskList(String id);
  Future<void> addTaskList(TaskList taskList);
  Future<void> updateTaskList(TaskList taskList);
  Future<void> removeTaskList(String id);
}
