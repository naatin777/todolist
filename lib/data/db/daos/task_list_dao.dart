import 'package:drift/drift.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/db/tables/task_list_table.dart';

part 'task_list_dao.g.dart';

@DriftAccessor(tables: [TaskLists])
class TaskListsDao extends DatabaseAccessor<AppDatabase>
    with _$TaskListsDaoMixin {
  TaskListsDao(AppDatabase db) : super(db);

  Stream<List<TaskList>> watchTaskList() {
    return (select(taskLists)).watch();
  }

  Future<TaskList> selectFromId(String id) async {
    try {
      return (await (select(taskLists)..where((tbl) => tbl.id.equals(id)))
          .getSingle());
    } catch (e) {
      return inbox;
    }
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
