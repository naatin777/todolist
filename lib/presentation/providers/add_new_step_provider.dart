import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/repositories/task_repository_impl.dart';
import 'package:todolist/domain/repositories/task_repository.dart';
import 'package:todolist/presentation/providers/add_new_task_provider.dart';
import 'package:todolist/utils.dart';

class AddNewStepProvider extends StateNotifier<List<Task>> {
  AddNewStepProvider({
    required this.taskRepository,
    required this.listId,
  }) : super([]);

  final TaskRepository taskRepository;
  final String listId;

  void insertStep(String title) {
    state = [
      ...state,
      Task(
        id: uuid.v4(),
        listId: listId,
        title: title,
        check: false,
        priority: 3,
      )
    ];
  }

  void removeStep(String id) {
    state = state.where((element) => element.id != id).toList();
  }

  void changeTitle(String id, String title) {
    state =
        state.map((e) => e.id == id ? e.copyWith(title: title) : e).toList();
  }

  void addStep() {
    for (var element in state) {
      taskRepository.addTask(element);
    }
  }
}

final addNewStepProvider =
    StateNotifierProvider.autoDispose<AddNewStepProvider, List<Task>>((ref) {
  final listId = ref.watch(addNewTaskProvider.select((value) => value.id));
  return AddNewStepProvider(
    taskRepository: TaskRepositoryImpl(),
    listId: listId,
  );
});
