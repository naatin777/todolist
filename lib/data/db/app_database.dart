import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/data/db/daos/tasks_dao.dart';
import 'package:todolist/data/db/daos/task_lists_dao.dart';
import 'package:todolist/data/db/tables/task_lists.dart';
import 'package:todolist/data/db/tables/tasks.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TaskLists, Tasks], daos: [TaskListsDao, TasksDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static final _instance = AppDatabase._();

  static AppDatabase getInstance() {
    return _instance;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(join(directory.path, 'todolist.sqlite'));
    return NativeDatabase(file);
  });
}
