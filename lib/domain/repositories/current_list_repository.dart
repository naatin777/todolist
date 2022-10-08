import 'package:todolist/data/db/app_database.dart';

abstract class CurrentListRepository {
  Future<String> getCurrentList();
  Future<void> setCurrentList(TaskList taskList);
}
