import 'package:drift/drift.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/db/tables/task_lists.dart';

part 'task_lists_dao.g.dart';

@DriftAccessor(tables: [TaskLists])
class TaskListsDao extends DatabaseAccessor<AppDatabase>
    with _$TaskListsDaoMixin {
  TaskListsDao(AppDatabase db) : super(db);

  Future<TaskList> selectFromId(String id) {
    return (select(taskLists)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<int> insert({required String id, required String title}) {
    return into(taskLists).insert(
      TaskListsCompanion(id: Value(id), title: Value(title)),
    );
  }

  Future<int> deleteFromId(String id) {
    return (delete(taskLists)..where((tbl) => tbl.id.equals(id))).go();
  }

  Stream<List<TaskList>> watchAll() {
    return select(taskLists).watch();
  }
}
