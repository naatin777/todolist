import 'package:drift/drift.dart';
import 'package:todolist/data/db/db.dart';

part 'task_list_db.g.dart';

class TaskLists extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
}

@DriftDatabase(tables: [TaskLists])
class TaskListDatabase extends _$TaskListDatabase {
  TaskListDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<TaskList>> watchTaskList() {
    return (select(taskLists)).watch();
  }

  Future<int> insertTaskList(String title) {
    return into(taskLists).insert(TaskListsCompanion(title: Value(title)));
  }

  Future<int> updateTaskList(TaskList taskList, String title) {
    return (update(taskLists)..where((tbl) => tbl.id.equals(taskList.id)))
        .write(TaskListsCompanion(title: Value(title)));
  }

  Future<void> deleteTaskList(TaskList taskList) {
    return (delete(taskLists)..where((tbl) => tbl.id.equals(taskList.id))).go();
  }
}
