import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/data/db/daos/task_dao.dart';
import 'package:todolist/data/db/daos/task_list_dao.dart';
import 'package:todolist/data/db/tables/task_list_table.dart';
import 'package:todolist/data/db/tables/task_table.dart';
import 'package:uuid/uuid.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TaskLists, Tasks], daos: [TaskListsDao, TasksDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static final _instance = AppDatabase();

  static AppDatabase getInstance() {
    return _instance;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(join(directory.path, 'task_list.sqlite'));
    return NativeDatabase(file);
  });
}

const uuid = Uuid();
