// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deadline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeadlineModel {
  DateTime? get dateTime => throw _privateConstructorUsedError;
  TimeOfDay? get timeOfDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeadlineModelCopyWith<DeadlineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeadlineModelCopyWith<$Res> {
  factory $DeadlineModelCopyWith(
          DeadlineModel value, $Res Function(DeadlineModel) then) =
      _$DeadlineModelCopyWithImpl<$Res, DeadlineModel>;
  @useResult
  $Res call({DateTime? dateTime, TimeOfDay? timeOfDay});
}

/// @nodoc
class _$DeadlineModelCopyWithImpl<$Res, $Val extends DeadlineModel>
    implements $DeadlineModelCopyWith<$Res> {
  _$DeadlineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? timeOfDay = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeOfDay: freezed == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeadlineModelCopyWith<$Res>
    implements $DeadlineModelCopyWith<$Res> {
  factory _$$_DeadlineModelCopyWith(
          _$_DeadlineModel value, $Res Function(_$_DeadlineModel) then) =
      __$$_DeadlineModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime, TimeOfDay? timeOfDay});
}

/// @nodoc
class __$$_DeadlineModelCopyWithImpl<$Res>
    extends _$DeadlineModelCopyWithImpl<$Res, _$_DeadlineModel>
    implements _$$_DeadlineModelCopyWith<$Res> {
  __$$_DeadlineModelCopyWithImpl(
      _$_DeadlineModel _value, $Res Function(_$_DeadlineModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? timeOfDay = freezed,
  }) {
    return _then(_$_DeadlineModel(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeOfDay: freezed == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc

class _$_DeadlineModel implements _DeadlineModel {
  const _$_DeadlineModel({required this.dateTime, required this.timeOfDay});

  @override
  final DateTime? dateTime;
  @override
  final TimeOfDay? timeOfDay;

  @override
  String toString() {
    return 'DeadlineModel(dateTime: $dateTime, timeOfDay: $timeOfDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeadlineModel &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, timeOfDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeadlineModelCopyWith<_$_DeadlineModel> get copyWith =>
      __$$_DeadlineModelCopyWithImpl<_$_DeadlineModel>(this, _$identity);
}

abstract class _DeadlineModel implements DeadlineModel {
  const factory _DeadlineModel(
      {required final DateTime? dateTime,
      required final TimeOfDay? timeOfDay}) = _$_DeadlineModel;

  @override
  DateTime? get dateTime;
  @override
  TimeOfDay? get timeOfDay;
  @override
  @JsonKey(ignore: true)
  _$$_DeadlineModelCopyWith<_$_DeadlineModel> get copyWith =>
      throw _privateConstructorUsedError;
}
