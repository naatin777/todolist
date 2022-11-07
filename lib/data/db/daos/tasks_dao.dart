import 'package:drift/drift.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/db/tables/tasks.dart';

part 'tasks_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(AppDatabase db) : super(db);

  Future<List<Task>> selectFromListId(String listId) {
    return (select(tasks)..where((tbl) => tbl.listId.equals(listId))).get();
  }

  Stream<List<Task>> watchFromListId(String listId) {
    return (select(tasks)..where((tbl) => tbl.listId.equals(listId))).watch();
  }

  Future<int> insert(Task task) {
    return into(tasks).insert(task.toCompanion(true));
  }

  Future<int> updateTask(Task task) {
    return (update(tasks)..where((tbl) => tbl.id.equals(task.id)))
        .write(task.toCompanion(true));
  }

  Future<int> deleteFromId(String id) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
  }
}
