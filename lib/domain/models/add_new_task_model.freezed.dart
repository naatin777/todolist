// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_new_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddNewTaskModel {
  TaskList get list => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  List<String> get subtask => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddNewTaskModelCopyWith<AddNewTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNewTaskModelCopyWith<$Res> {
  factory $AddNewTaskModelCopyWith(
          AddNewTaskModel value, $Res Function(AddNewTaskModel) then) =
      _$AddNewTaskModelCopyWithImpl<$Res>;
  $Res call(
      {TaskList list,
      String title,
      Priority priority,
      DateTime? deadline,
      List<String> subtask,
      String description});
}

/// @nodoc
class _$AddNewTaskModelCopyWithImpl<$Res>
    implements $AddNewTaskModelCopyWith<$Res> {
  _$AddNewTaskModelCopyWithImpl(this._value, this._then);

  final AddNewTaskModel _value;
  // ignore: unused_field
  final $Res Function(AddNewTaskModel) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? title = freezed,
    Object? priority = freezed,
    Object? deadline = freezed,
    Object? subtask = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as TaskList,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtask: subtask == freezed
          ? _value.subtask
          : subtask // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddNewTaskModelCopyWith<$Res>
    implements $AddNewTaskModelCopyWith<$Res> {
  factory _$$_AddNewTaskModelCopyWith(
          _$_AddNewTaskModel value, $Res Function(_$_AddNewTaskModel) then) =
      __$$_AddNewTaskModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {TaskList list,
      String title,
      Priority priority,
      DateTime? deadline,
      List<String> subtask,
      String description});
}

/// @nodoc
class __$$_AddNewTaskModelCopyWithImpl<$Res>
    extends _$AddNewTaskModelCopyWithImpl<$Res>
    implements _$$_AddNewTaskModelCopyWith<$Res> {
  __$$_AddNewTaskModelCopyWithImpl(
      _$_AddNewTaskModel _value, $Res Function(_$_AddNewTaskModel) _then)
      : super(_value, (v) => _then(v as _$_AddNewTaskModel));

  @override
  _$_AddNewTaskModel get _value => super._value as _$_AddNewTaskModel;

  @override
  $Res call({
    Object? list = freezed,
    Object? title = freezed,
    Object? priority = freezed,
    Object? deadline = freezed,
    Object? subtask = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_AddNewTaskModel(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as TaskList,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subtask: subtask == freezed
          ? _value._subtask
          : subtask // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddNewTaskModel implements _AddNewTaskModel {
  const _$_AddNewTaskModel(
      {required this.list,
      this.title = "",
      this.priority = Priority.no,
      this.deadline,
      final List<String> subtask = const [],
      this.description = ""})
      : _subtask = subtask;

  @override
  final TaskList list;
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
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'AddNewTaskModel(list: $list, title: $title, priority: $priority, deadline: $deadline, subtask: $subtask, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddNewTaskModel &&
            const DeepCollectionEquality().equals(other.list, list) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.priority, priority) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality().equals(other._subtask, _subtask) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(list),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(priority),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(_subtask),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_AddNewTaskModelCopyWith<_$_AddNewTaskModel> get copyWith =>
      __$$_AddNewTaskModelCopyWithImpl<_$_AddNewTaskModel>(this, _$identity);
}

abstract class _AddNewTaskModel implements AddNewTaskModel {
  const factory _AddNewTaskModel(
      {required final TaskList list,
      final String title,
      final Priority priority,
      final DateTime? deadline,
      final List<String> subtask,
      final String description}) = _$_AddNewTaskModel;

  @override
  TaskList get list;
  @override
  String get title;
  @override
  Priority get priority;
  @override
  DateTime? get deadline;
  @override
  List<String> get subtask;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_AddNewTaskModelCopyWith<_$_AddNewTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
