import 'package:drift/drift.dart';
import 'package:todolist/data/db/db.dart';

part 'task_db.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get list => integer()();

  TextColumn get title => text()();

  BoolColumn get check => boolean()();
}

@DriftDatabase(tables: [Tasks])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Task>> watchTask() {
    return (select(tasks)).watch();
  }

  Future<int> insertTask(int list, String title, bool check) {
    return into(tasks).insert(
      TasksCompanion(
        list: Value(list),
        title: Value(title),
        check: Value(check),
      ),
    );
  }

  Future<int> updateTask(Task task, int list, String title, bool check) {
    return (update(tasks)..where((tbl) => tbl.id.equals(task.id))).write(
      TasksCompanion(
        list: Value(list),
        title: Value(title),
        check: Value(check),
      ),
    );
  }

  Future<void> deleteTask(Task task) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(task.id))).go();
  }
}
