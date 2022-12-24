import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/task_list_repository_impl.dart';

final taskListProvider = Provider((ref) => TaskListRepositoryImpl());
final allTaskListsStreamProvider =
    StreamProvider((ref) => ref.watch(taskListProvider).watchAllTaskLists());
final taskListStreamProvider = StreamProvider.autoDispose.family(
    (ref, String arg) => ref.watch(taskListProvider).watchTaskList(arg));
final taskListFutureProvider = FutureProvider.autoDispose.family(
  (ref, String arg) => ref.watch(taskListProvider).getTaskList(arg),
);
