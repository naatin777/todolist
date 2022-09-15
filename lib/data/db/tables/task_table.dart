import 'package:drift/drift.dart';
import 'package:todolist/data/db/app_database.dart';

class Tasks extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();

  TextColumn get list => text()();

  TextColumn get title => text()();

  BoolColumn get check => boolean()();
}
