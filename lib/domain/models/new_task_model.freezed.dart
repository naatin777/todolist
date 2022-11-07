// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewTaskModel {
  String get listId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  List<String> get subtask => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewTaskModelCopyWith<NewTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTaskModelCopyWith<$Res> {
  factory $NewTaskModelCopyWith(
          NewTaskModel value, $Res Function(NewTaskModel) then) =
      _$NewTaskModelCopyWithImpl<$Res, NewTaskModel>;
  @useResult
  $Res call(
      {String listId,
      String title,
      Priority priority,
      DateTime? deadline,
      List<String> subtask,
      String? description});
}

/// @nodoc
class _$NewTaskModelCopyWithImpl<$Res, $Val extends NewTaskModel>
    implements $NewTaskModelCopyWith<$Res> {
  _$NewTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listId = null,
    Object? title = null,
    Object? priority = null,
    Object? deadline = freezed,
    Object? subtask = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtask: null == subtask
          ? _value.subtask
          : subtask // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewTaskModelCopyWith<$Res>
    implements $NewTaskModelCopyWith<$Res> {
  factory _$$_NewTaskModelCopyWith(
          _$_NewTaskModel value, $Res Function(_$_NewTaskModel) then) =
      __$$_NewTaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String listId,
      String title,
      Priority priority,
      DateTime? deadline,
      List<String> subtask,
      String? description});
}

/// @nodoc
class __$$_NewTaskModelCopyWithImpl<$Res>
    extends _$NewTaskModelCopyWithImpl<$Res, _$_NewTaskModel>
    implements _$$_NewTaskModelCopyWith<$Res> {
  __$$_NewTaskModelCopyWithImpl(
      _$_NewTaskModel _value, $Res Function(_$_NewTaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listId = null,
    Object? title = null,
    Object? priority = null,
    Object? deadline = freezed,
    Object? subtask = null,
    Object? description = freezed,
  }) {
    return _then(_$_NewTaskModel(
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtask: null == subtask
          ? _value._subtask
          : subtask // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NewTaskModel implements _NewTaskModel {
  const _$_NewTaskModel(
      {required this.listId,
      this.title = "",
      this.priority = Priority.no,
      this.deadline,
      final List<String> subtask = const [],
      this.description})
      : _subtask = subtask;

  @override
  final String listId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final Priority priority;
  @override
  final DateTime? deadline;
  final List<String> _subtask;
  @override
  @JsonKey()
  List<String> get subtask {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtask);
  }

  @override
  final String? description;

  @override
  String toString() {
    return 'NewTaskModel(listId: $listId, title: $title, priority: $priority, deadline: $deadline, subtask: $subtask, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewTaskModel &&
            (identical(other.listId, listId) || other.listId == listId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            const DeepCollectionEquality().equals(other._subtask, _subtask) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listId, title, priority,
      deadline, const DeepCollectionEquality().hash(_subtask), description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewTaskModelCopyWith<_$_NewTaskModel> get copyWith =>
      __$$_NewTaskModelCopyWithImpl<_$_NewTaskModel>(this, _$identity);
}

abstract class _NewTaskModel implements NewTaskModel {
  const factory _NewTaskModel(
      {required final String listId,
      final String title,
      final Priority priority,
      final DateTime? deadline,
      final List<String> subtask,
      final String? description}) = _$_NewTaskModel;

  @override
  String get listId;
  @override
  String get title;
  @override
  Priority get priority;
  @override
  DateTime? get deadline;
  @override
  List<String> get subtask;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_NewTaskModelCopyWith<_$_NewTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
