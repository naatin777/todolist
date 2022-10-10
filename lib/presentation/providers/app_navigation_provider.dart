import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';

class AppNavigationProvider extends StateNotifier<Task?> {
  AppNavigationProvider() : super(null);

  jumpToTask(Task task) {
    state = task;
  }

  jumpToHome() {
    state = null;
  }
}

final appNavigationProvider =
    StateNotifierProvider<AppNavigationProvider, Task?>((ref) {
  return AppNavigationProvider();
});
