import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/task_list_repository_impl.dart';

final taskListProvider = Provider((ref) => TaskListRepositoryImpl());
final taskListsStreamProvider =
    StreamProvider((ref) => TaskListRepositoryImpl().watchAllTaskLists());
final taskListFutureProvider = FutureProvider.family(
    (ref, String args) => TaskListRepositoryImpl().getTaskList(args));
