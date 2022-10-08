import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/models/add_new_task_model.dart';
import 'package:todolist/domain/repositories/task_repository.dart';
import 'package:uuid/uuid.dart';

class TaskRepositoryImpl extends TaskRepository {
  final _tasksDao = AppDatabase.getInstance().tasksDao;
  final _uuid = const Uuid();

  @override
  Future<void> addTask(AddNewTaskModel addNewTaskModel) async {
    await _tasksDao.insert(
      id: _uuid.v4(),
      listId: addNewTaskModel.list.id,
      title: addNewTaskModel.title,
      check: false,
      priority: addNewTaskModel.priority.index,
      deadline: addNewTaskModel.deadline,
      subtask: addNewTaskModel.subtask.isNotEmpty
          ? addNewTaskModel.subtask
              .reduce((value, element) => "$value,$element")
          : "",
      description: addNewTaskModel.description,
    );
  }

  @override
  Future<void> removeTask(Task task) async {
    await _tasksDao.deleteFromId(task.id);
  }

  @override
  Future<void> updateTask({
    required Task task,
    String? listId,
    String? title,
    bool? check,
    int? priority,
    DateTime? deadline,
    String? subtask,
    String? description,
  }) async {
    await _tasksDao.updateTask(
      task: task,
      listId: listId,
      title: title,
      check: check,
      priority: priority,
      deadline: deadline,
      subtask: subtask,
      description: description,
    );
  }

  @override
  Stream<List<Task>> watchTasksFromTaskList(TaskList taskList) {
    return _tasksDao.watchFromListId(taskList.id);
  }
}
