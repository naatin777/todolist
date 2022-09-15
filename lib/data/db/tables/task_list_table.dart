import 'package:drift/drift.dart';
import 'package:todolist/data/db/app_database.dart';

class TaskLists extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();

  TextColumn get title => text()();
}
