import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/task_repository_impl.dart';
import 'package:todolist/domain/models/new_task_model.dart';
import 'package:todolist/presentation/providers/task_list_navigation_provider.dart';

class NewTaskProvider extends StateNotifier<NewTaskModel> {
  NewTaskProvider(String listId) : super(NewTaskModel(listId: listId));

  final _taskRepository = TaskRepositoryImpl();

  Future<void> addTask(TextEditingController controller) async {
    await _taskRepository.addTask(state);
    reset(controller);
  }

  void reset(TextEditingController controller) {
    controller.clear();
    state = state.copyWith(title: "", description: "", subtask: []);
  }

  void changeTitle(String title) {
    state = state.copyWith(title: title);
  }

  void changeList(String listId) {
    state = state.copyWith(listId: listId);
  }

  void changePriority(Priority priority) {
    state = state.copyWith(priority: priority);
  }

  void addSubtask(String title) {
    state = state.copyWith(subtask: state.subtask..add(title));
  }

  void removeSubtask(int index) {
    state = state.copyWith(subtask: state.subtask..removeAt(index));
  }
}

final newTaskProvider =
    StateNotifierProvider.autoDispose<NewTaskProvider, NewTaskModel>((ref) {
  final taskList = ref.watch(taskListNavigationProvider);
  return NewTaskProvider(taskList.id);
});
