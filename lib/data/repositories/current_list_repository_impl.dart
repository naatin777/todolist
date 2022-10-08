import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/repositories/current_list_repository.dart';

class CurrentListRepositoryImpl extends CurrentListRepository {
  static const _key = "current_list";

  @override
  Future<String> getCurrentList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? inbox.id;
  }

  @override
  Future<void> setCurrentList(TaskList taskList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, taskList.id);
  }
}
