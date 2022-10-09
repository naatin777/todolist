import 'package:freezed_annotation/freezed_annotation.dart';

part 'multi_select_model.freezed.dart';

@freezed
class MultiSelectModel with _$MultiSelectModel {
  const factory MultiSelectModel({
    @Default(false) bool isSelect,
    @Default([]) List<String> item,
  }) = _MultiSelectModel;
}
