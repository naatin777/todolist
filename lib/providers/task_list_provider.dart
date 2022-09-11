import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/task_list_db.dart';

final taskListDatabaseProvider = Provider((ref) {
  final taskListDatabase = TaskListDatabase();
  ref.onDispose(() {
    taskListDatabase.close();
  });
  return taskListDatabase;
});

final taskListProvider = StreamProvider((ref) {
  return ref.read(taskListDatabaseProvider).watchTaskList();
});
