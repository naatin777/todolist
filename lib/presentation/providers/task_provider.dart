import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/task_repository_impl.dart';

final taskProvider = Provider((ref) => TaskRepositoryImpl());
final tasksStreamProvider = StreamProvider.family
    .autoDispose((ref, String args) => TaskRepositoryImpl().watchTasks(args));
