import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/providers/todo_navigation_provider.dart';

class AddNewTaskProvider extends ChangeNotifier {
  AddNewTaskProvider(this.ref) {
    _list = ref.watch(todoNavigationProvider);
  }

  final Ref ref;

  final _appDatabase = AppDatabase.getInstance();

  String _title = "";

  TaskList _list = inbox;

  TaskList get list => _list;

  Priority _priority = Priority.no;

  Priority get priority => _priority;

  DateTime? _dateTime;

  changeTitle(String title) {
    _title = title;
    notifyListeners();
  }

  changeList(TaskList taskList) {
    _list = taskList;
    notifyListeners();
  }

  changePriority(Priority priority) {
    _priority = priority;
    notifyListeners();
  }

  changeDateTime(DateTime? dateTime, TimeOfDay? timeOfDay) {
    if (dateTime != null) {
      _dateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        timeOfDay?.hour ?? dateTime.hour,
        timeOfDay?.minute ?? dateTime.minute,
      );
    }
  }

  addNewTask() {
    _appDatabase.tasksDao.insertTask(
      list: _list.id,
      title: _title,
      check: false,
      deadline: _dateTime,
    );
  }
}

final addNewTaskProvider = ChangeNotifierProvider.autoDispose((ref) {
  return AddNewTaskProvider(ref);
});

enum Priority {
  high,
  medium,
  low,
  no,
}
