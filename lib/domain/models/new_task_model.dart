import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_task_model.freezed.dart';

@freezed
class NewTaskModel with _$NewTaskModel {
  const factory NewTaskModel({
    required String listId,
    @Default("") String title,
    @Default(Priority.no) Priority priority,
    DateTime? deadline,
    @Default([]) List<String> subtask,
    String? description,
  }) = _NewTaskModel;
}

enum Priority {
  high,
  medium,
  low,
  no,
}
