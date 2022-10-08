import 'package:drift/drift.dart';

class TaskLists extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
}
