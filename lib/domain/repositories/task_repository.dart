import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/models/add_new_task_model.dart';

abstract class TaskRepository {
  Future<void> addTask(AddNewTaskModel addNewTaskModel);
  Future<void> removeTask(Task task);
  Future<void> updateTask({
    required Task task,
    String? listId,
    String? title,
    bool? check,
    int? priority,
    DateTime? deadline,
    String? subtask,
    String? description,
  });
  Stream<List<Task>> watchTasksFromTaskList(TaskList taskList);
}
