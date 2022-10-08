import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/presentation/providers/add_new_task_provider.dart';

part 'add_new_task_model.freezed.dart';

@freezed
class AddNewTaskModel with _$AddNewTaskModel {
  const factory AddNewTaskModel({
    required TaskList list,
    @Default("") String title,
    @Default(Priority.no) Priority priority,
    DateTime? deadline,
    @Default([]) List<String> subtask,
    @Default("") String description,
  }) = _AddNewTaskModel;
}

enum Priority {
  high,
  medium,
  low,
  no,
}