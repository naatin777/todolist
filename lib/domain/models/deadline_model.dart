import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deadline_model.freezed.dart';

@freezed
class DeadlineModel with _$DeadlineModel {
  const factory DeadlineModel({
    required DateTime? dateTime,
    required TimeOfDay? timeOfDay,
  }) = _DeadlineModel;
}
