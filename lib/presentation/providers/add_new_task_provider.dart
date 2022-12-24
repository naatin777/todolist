import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/data/repositories/task_repository_impl.dart';
import 'package:todolist/domain/repositories/task_repository.dart';
import 'package:todolist/presentation/providers/router_provider.dart';
import 'package:todolist/utils.dart';

class AddNewTaskProvider extends StateNotifier<Task> {
  AddNewTaskProvider({
    required this.taskRepository,
    required String listId,
  }) : super(Task(
            id: uuid.v4(),
            listId: listId,
            title: "",
            check: false,
            priority: 3));

  final TaskRepository taskRepository;

  void changeListId(String value) {
    state = state.copyWith(listId: value);
  }

  void changePriority(int value) {
    state = state.copyWith(priority: value);
  }

  void changeDate(DateTime? value) {
    state = state.copyWith(deadlineDate: Value(value));
  }

  void changeTime(TimeOfDay? value) {
    final now = DateTime.now();
    state = state.copyWith(
      deadlineTime: Value(value != null
          ? DateTime(now.year, now.month, now.day, value.hour, value.minute)
          : null),
    );
  }

  void changeDateTime(DateTime? dateTime, TimeOfDay? timeOfDay) {
    state = state.copyWith(
      deadlineDate: Value(dateTime),
      deadlineTime: Value(
        dateTime != null && timeOfDay != null
            ? DateTime(
                dateTime.year,
                dateTime.month,
                dateTime.day,
                timeOfDay.hour,
                timeOfDay.minute,
              )
            : null,
      ),
    );
  }

  void changeDescription(String value) {
    state = state.copyWith(description: Value(value));
  }

  void changeTitle(String value) {
    state = state.copyWith(title: value);
  }

  void reset() {
    state = Task(
      id: uuid.v4(),
      listId: state.listId,
      title: "",
      check: false,
      priority: 3,
      subtask: null,
      description: null,
    );
  }

  Future<void> addTask(String title, String description) async {
    taskRepository.addTask(
      state.copyWith(title: title, description: Value(description)),
    );
  }
}

final addNewTaskProvider =
    StateNotifierProvider.autoDispose<AddNewTaskProvider, Task>((ref) {
  final listId = ref.read(listIdProvider);
  return AddNewTaskProvider(
    taskRepository: TaskRepositoryImpl(),
    listId: listId,
  );
});

final deadlineChipProvider = Provider.autoDispose((ref) {
  final addNewTask = ref.watch(addNewTaskProvider);
  final deadlineDate = addNewTask.deadlineDate;
  final deadlineTime = addNewTask.deadlineTime;
  final now = DateTime.now();
  final tomorrow = DateTime.now().add(const Duration(days: 1));
  final dateFormat = DateFormat("yyyy-MM-dd");
  final time = deadlineTime == null
      ? ""
      : " ${deadlineTime.hour}:${deadlineTime.minute}";
  if (deadlineDate != null) {
    if (dateFormat.format(deadlineDate) == dateFormat.format(now)) {
      return "Today$time";
    } else if (dateFormat.format(deadlineDate) == dateFormat.format(tomorrow)) {
      return "Tomorrow$time";
    } else {
      return "${dateFormat.format(deadlineDate)}$time";
    }
  } else {
    return null;
  }
});
