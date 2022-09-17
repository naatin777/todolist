import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';

class AddNewTaskProvider extends ChangeNotifier {
  final _appDatabase = AppDatabase.getInstance();

  String _title = "";

  TaskList _list = inbox;

  Priority _priority = Priority.no;

  Priority get priority => _priority;

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

  addNewTask() {
    _appDatabase.tasksDao.insertTask(_list.id, _title, false);
  }
}

final addNewTaskProvider = ChangeNotifierProvider((ref) {
  return AddNewTaskProvider();
});

enum Priority {
  high,
  medium,
  low,
  no,
}
