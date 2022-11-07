import 'package:drift/drift.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/db/tables/task_lists.dart';

part 'task_lists_dao.g.dart';

@DriftAccessor(tables: [TaskLists])
class TaskListsDao extends DatabaseAccessor<AppDatabase>
    with _$TaskListsDaoMixin {
  TaskListsDao(AppDatabase db) : super(db);

  Future<List<TaskList>> selectAll() {
    return select(taskLists).get();
  }

  Future<TaskList> selectFromId(String id) {
    return (select(taskLists)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Stream<List<TaskList>> watchAll() {
    return select(taskLists).watch();
  }

  Stream<TaskList> watchFromId(String id) {
    return (select(taskLists)..where((tbl) => tbl.id.equals(id))).watchSingle();
  }

  Future<int> insertTaskList(TaskList taskList) {
    return into(taskLists).insert(taskList.toCompanion(true));
  }

  Future<int> updateTaskList(TaskList taskList) {
    return (update(taskLists)..where((tbl) => tbl.id.equals(taskList.id)))
        .write(taskList.toCompanion(true));
  }

  Future<int> deleteTaskList(String id) {
    return (delete(taskLists)..where((tbl) => tbl.id.equals(id))).go();
  }
}
