import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/task_db.dart';

final taskDatabaseProvider = Provider((ref) {
  final taskDatabase = TaskDatabase();
  ref.onDispose(() {
    taskDatabase.close();
  });
  return taskDatabase;
});

final taskProvider = StreamProvider((ref) {
  return ref.read(taskDatabaseProvider).watchTask();
});
