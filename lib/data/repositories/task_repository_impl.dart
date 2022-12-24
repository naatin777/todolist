import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/repositories/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final _tasksDao = AppDatabase.getInstance().tasksDao;

  @override
  Future<List<Task>> getTasks(String listId) async {
    return await _tasksDao.selectFromListId(listId);
  }

  @override
  Stream<List<Task>> watchTasks(String listId) {
    return _tasksDao.watchFromListId(listId);
  }

  @override
  Future<Task> getTasksFromId(String id) async {
    return await _tasksDao.selectFromId(id);
  }

  @override
  Stream<Task> watchTasksFromId(String id) {
    return _tasksDao.watchFromId(id);
  }

  @override
  Future<void> addTask(Task task) async {
    await _tasksDao.insert(task);
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
