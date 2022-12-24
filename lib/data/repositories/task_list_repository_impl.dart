import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/repositories/task_list_repository.dart';

class TaskListRepositoryImpl extends TaskListRepository {
  final _taskListsDao = AppDatabase.getInstance().taskListsDao;

  @override
  Future<List<TaskList>> getAllTaskLists() async {
    try {
      return await _taskListsDao.selectAll();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<TaskList> getTaskList(String id) async {
    try {
      return await _taskListsDao.selectFromId(id);
    } catch (e) {
      return inbox;
    }
  }

  @override
  Stream<List<TaskList>> watchAllTaskLists() {
    return _taskListsDao.watchAll();
  }

  @override
  Stream<TaskList> watchTaskList(String id) {
    return _taskListsDao.watchFromId(id);
  }

  @override
  Future<void> addTaskList(TaskList taskList) async {
    await _taskListsDao.insertTaskList(taskList);
  }

  @override
  Future<void> updateTaskList(TaskList taskList) async {
    await _taskListsDao.updateTaskList(taskList);
  }

  @override
  Future<void> removeTaskList(String id) async {
    await _taskListsDao.deleteTaskList(id);
  }
}
