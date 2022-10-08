import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/repositories/task_list_repository.dart';
import 'package:uuid/uuid.dart';

class TaskListRepositoryImpl extends TaskListRepository {
  final _taskListsDao = AppDatabase.getInstance().taskListsDao;
  final _uuid = const Uuid();

  @override
  Future<TaskList> getTaskList(String id) async {
    try {
      return await _taskListsDao.selectFromId(id);
    } catch (e) {
      return inbox;
    }
  }

  @override
  Future<void> addTaskList({required String title}) async {
    await _taskListsDao.insert(id: _uuid.v4(), title: title);
  }

  @override
  Future<void> removeTaskList({required TaskList taskList}) async {
    await _taskListsDao.deleteFromId(taskList.id);
  }

  @override
  Stream<List<TaskList>> watchAllTaskLists() {
    return _taskListsDao.watchAll();
  }
}
