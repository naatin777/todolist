import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/constant.dart';

part 'task_list_db.g.dart';

class TaskLists extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();

  TextColumn get title => text()();
}

@DriftDatabase(tables: [TaskLists])
class TaskListDatabase extends _$TaskListDatabase {
  TaskListDatabase() : super(_openConnection());

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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(join(directory.path, 'task_list.sqlite'));
    return NativeDatabase(file);
  });
}
