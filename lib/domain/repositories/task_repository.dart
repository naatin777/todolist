import 'package:todolist/data/db/app_database.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks(String listId);
  Stream<List<Task>> watchTasks(String listId);
  Future<Task> getTasksFromId(String id);
  Stream<Task> watchTasksFromId(String id);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> removeTask(String id);
}
