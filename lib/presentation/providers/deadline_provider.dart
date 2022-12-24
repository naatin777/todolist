import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/domain/models/deadline_model.dart';

class DeadlineProvider extends StateNotifier<DeadlineModel> {
  DeadlineProvider()
      : super(const DeadlineModel(dateTime: null, timeOfDay: null));

  void changeDateTime(DateTime? value) {
    state = state.copyWith(dateTime: value ?? state.dateTime);
  }

  void changeTimeOfDay(TimeOfDay? value) {
    state = state.copyWith(timeOfDay: value ?? state.timeOfDay);
  }

  void clear() {
    state = const DeadlineModel(dateTime: null, timeOfDay: null);
  }
}

final deadlineProvider =
    StateNotifierProvider.autoDispose<DeadlineProvider, DeadlineModel>(
        (ref) => DeadlineProvider());
