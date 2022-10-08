import 'package:drift/drift.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/db/tables/tasks.dart';

part 'tasks_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(AppDatabase db) : super(db);

  Future<int> insert({
    required String id,
    required String listId,
    required String title,
    required bool check,
    required int priority,
    DateTime? deadline,
    required String subtask,
    required String description,
  }) {
    return into(tasks).insert(
      TasksCompanion(
        id: Value(id),
        listId: Value(listId),
        title: Value(title),
        check: Value(check),
        priority: Value(priority),
        deadline: Value(deadline),
        subtask: Value(subtask),
        description: Value(description),
      ),
    );
  }

  Future<int> deleteFromId(String id) {
    return (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> updateTask({
    required Task task,
    String? listId,
    String? title,
    bool? check,
    int? priority,
    DateTime? deadline,
    String? subtask,
    String? description,
  }) {
    return (update(tasks)..where((tbl) => tbl.id.equals(task.id))).write(
      TasksCompanion(
        listId: Value(listId ?? task.listId),
        title: Value(title ?? task.title),
        check: Value(check ?? task.check),
        priority: Value(priority ?? task.priority),
        deadline: Value(deadline ?? task.deadline),
        subtask: Value(subtask ?? task.subtask),
        description: Value(description ?? task.description),
      ),
    );
  }

  Stream<List<Task>> watchFromListId(String listId) {
    return (select(tasks)..where((tbl) => tbl.listId.equals(listId))).watch();
  }
}
