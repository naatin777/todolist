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

  Stream<List<Task>> watchTaskFromList(TaskList taskList) {
    return ((select(tasks))..where((tbl) => tbl.list.equals(taskList.id)))
        .watch();
  }

  Future<int> insertTask({
    required String list,
    required String title,
    required bool check,
    DateTime? deadline,
  }) {
    return into(tasks).insert(
      TasksCompanion(
        list: Value(list),
        title: Value(title),
        check: Value(check),
        deadline: Value(deadline),
      ),
    );
  }

  Future<int> updateTask({
    required Task task,
    String? list,
    String? title,
    bool? check,
    DateTime? deadline,
  }) {
    return (update(tasks)..where((tbl) => tbl.id.equals(task.id))).write(
      TasksCompanion(
        list: Value(list ?? task.list),
        title: Value(title ?? task.title),
        check: Value(check ?? task.check),
        deadline: Value(deadline ?? task.deadline),
      ),
    );
  }

  Future<void> deleteTask(Task task) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(task.id))).go();
  }
}
