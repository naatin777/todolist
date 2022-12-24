import 'package:drift/drift.dart';

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get listId => text()();
  TextColumn get title => text()();
  BoolColumn get check => boolean()();
  IntColumn get priority => integer()();
  DateTimeColumn get deadlineDate => dateTime().nullable()();
  DateTimeColumn get deadlineTime => dateTime().nullable()();
  TextColumn get subtask => text().nullable()();
  TextColumn get description => text().nullable()();
}
