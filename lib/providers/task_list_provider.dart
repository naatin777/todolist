import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';

final taskListDatabaseProvider = Provider((ref) {
  return AppDatabase.getInstance().taskListsDao;
});

final taskListProvider = StreamProvider((ref) {
  return ref.read(taskListDatabaseProvider).watchTaskList();
});
