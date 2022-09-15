import 'package:drift/drift.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/db/tables/task_table.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(AppDatabase db) : super(db);

  Stream<List<Task>> watchTask() {
    return (select(tasks)).watch();
  }

  Future<int> insertTask(String list, String title, bool check) {
    return into(tasks).insert(
      TasksCompanion(
        list: Value(list),
        title: Value(title),
        check: Value(check),
      ),
    );
  }

  Future<int> updateTask({
    required Task task,
    String? list,
    String? title,
    bool? check,
  }) {
    return (update(tasks)..where((tbl) => tbl.id.equals(task.id))).write(
      TasksCompanion(
        list: Value(list ?? task.list),
        title: Value(title ?? task.title),
        check: Value(check ?? task.check),
      ),
    );
  }

  Future<void> deleteTask(Task task) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(task.id))).go();
  }
}
