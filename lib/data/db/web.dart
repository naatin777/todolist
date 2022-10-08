import 'package:drift/web.dart';
import 'package:todolist/data/db/app_database.dart';

AppDatabase constructDb() {
  return AppDatabase(WebDatabase('db'));
}
