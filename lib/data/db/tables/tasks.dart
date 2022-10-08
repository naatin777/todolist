import 'package:drift/drift.dart';

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get listId => text()();
  TextColumn get title => text()();
  BoolColumn get check => boolean()();
  IntColumn get priority => integer()();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get subtask => text()();
  TextColumn get description => text()();
}
