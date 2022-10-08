import 'package:drift/drift.dart';
import 'package:todolist/data/db/daos/tasks_dao.dart';
import 'package:todolist/data/db/daos/task_lists_dao.dart';
import 'package:todolist/data/db/shared.dart';
import 'package:todolist/data/db/tables/task_lists.dart';
import 'package:todolist/data/db/tables/tasks.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TaskLists, Tasks], daos: [TaskListsDao, TasksDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  static final AppDatabase _instance = constructDb();

  static AppDatabase getInstance() => _instance;
}
