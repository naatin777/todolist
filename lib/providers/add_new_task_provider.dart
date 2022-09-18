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

final addNewTaskProvider = ChangeNotifierProvider((ref) {
  return AddNewTaskProvider();
});

enum Priority {
  high,
  medium,
  low,
  no,
}
