import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/task_repository_impl.dart';

final taskProvider = Provider((ref) => TaskRepositoryImpl());
final tasksFromListIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String arg) {
  final tasks = ref.watch(taskProvider).watchTasks(arg);
  return tasks;
});
final tasksFromIdStreamProvider =
    StreamProvider.autoDispose.family((ref, String arg) {
  final tasks = ref.watch(taskProvider).watchTasksFromId(arg);
  return tasks;
});
