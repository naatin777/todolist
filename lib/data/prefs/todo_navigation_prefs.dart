import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';

class TodoNavigationPrefs {
  static const key = "todo_navigation";

  static final TodoNavigationPrefs _instance = TodoNavigationPrefs._();

  factory TodoNavigationPrefs() {
    return _instance;
  }

  TodoNavigationPrefs._();

  Future<String> loadTodoNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? inbox.id;
  }

  Future<void> saveTodoNavigation(TaskList taskList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, taskList.id);
  }
}
