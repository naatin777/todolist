import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/models/new_task_model.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks(String listId);
  Stream<List<Task>> watchTasks(String listId);
  Future<void> addTask(NewTaskModel newTaskModel);
  Future<void> updateTask(Task task);
  Future<void> removeTask(String id);
}
