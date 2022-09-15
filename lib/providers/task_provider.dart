import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';

final taskDatabaseProvider = Provider((ref) {
  final taskDatabase = AppDatabase();
  ref.onDispose(() {
    taskDatabase.close();
  });
  return taskDatabase.tasksDao;
});

final taskProvider = StreamProvider((ref) {
  return ref.read(taskDatabaseProvider).watchTask();
});
