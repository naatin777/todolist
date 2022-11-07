import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/models/new_task_model.dart';
import 'package:todolist/domain/repositories/task_repository.dart';
import 'package:uuid/uuid.dart';

class TaskRepositoryImpl extends TaskRepository {
  final _tasksDao = AppDatabase.getInstance().tasksDao;
  final _uuid = const Uuid();

  @override
  Future<List<Task>> getTasks(String listId) async {
    return await _tasksDao.selectFromListId(listId);
  }

  @override
  Stream<List<Task>> watchTasks(String listId) {
    return _tasksDao.watchFromListId(listId);
  }

  @override
  Future<void> addTask(NewTaskModel newTaskModel) async {
    await _tasksDao.insert(
      Task(
        id: _uuid.v4(),
        listId: newTaskModel.listId,
        title: newTaskModel.title,
        check: false,
        priority: newTaskModel.priority.index,
        deadline: newTaskModel.deadline,
        subtask: newTaskModel.subtask.isNotEmpty
            ? newTaskModel.subtask.join(",")
            : "",
        description: newTaskModel.description,
      ),
    );
  }

  @override
  Future<void> updateTask(Task task) async {
    await _tasksDao.updateTask(task);
  }

  @override
  Future<void> removeTask(String id) async {
    await _tasksDao.deleteFromId(id);
  }
}
