// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'multi_select_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MultiSelectModel {
  bool get isSelect => throw _privateConstructorUsedError;
  List<String> get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultiSelectModelCopyWith<MultiSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiSelectModelCopyWith<$Res> {
  factory $MultiSelectModelCopyWith(
          MultiSelectModel value, $Res Function(MultiSelectModel) then) =
      _$MultiSelectModelCopyWithImpl<$Res>;
  $Res call({bool isSelect, List<String> item});
}

/// @nodoc
class _$MultiSelectModelCopyWithImpl<$Res>
    implements $MultiSelectModelCopyWith<$Res> {
  _$MultiSelectModelCopyWithImpl(this._value, this._then);

  final MultiSelectModel _value;
  // ignore: unused_field
  final $Res Function(MultiSelectModel) _then;

  @override
  $Res call({
    Object? isSelect = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      isSelect: isSelect == freezed
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_MultiSelectModelCopyWith<$Res>
    implements $MultiSelectModelCopyWith<$Res> {
  factory _$$_MultiSelectModelCopyWith(
          _$_MultiSelectModel value, $Res Function(_$_MultiSelectModel) then) =
      __$$_MultiSelectModelCopyWithImpl<$Res>;
  @override
  $Res call({bool isSelect, List<String> item});
}

/// @nodoc
class __$$_MultiSelectModelCopyWithImpl<$Res>
    extends _$MultiSelectModelCopyWithImpl<$Res>
    implements _$$_MultiSelectModelCopyWith<$Res> {
  __$$_MultiSelectModelCopyWithImpl(
      _$_MultiSelectModel _value, $Res Function(_$_MultiSelectModel) _then)
      : super(_value, (v) => _then(v as _$_MultiSelectModel));

  @override
  _$_MultiSelectModel get _value => super._value as _$_MultiSelectModel;

  @override
  $Res call({
    Object? isSelect = freezed,
    Object? item = freezed,
  }) {
    return _then(_$_MultiSelectModel(
      isSelect: isSelect == freezed
          ? _value.isSelect
          : isSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      item: item == freezed
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_MultiSelectModel implements _MultiSelectModel {
  const _$_MultiSelectModel(
      {this.isSelect = false, final List<String> item = const []})
      : _item = item;

  @override
  @JsonKey()
  final bool isSelect;
  final List<String> _item;
  @override
  @JsonKey()
  List<String> get item {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  @override
  String toString() {
    return 'MultiSelectModel(isSelect: $isSelect, item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MultiSelectModel &&
            const DeepCollectionEquality().equals(other.isSelect, isSelect) &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSelect),
      const DeepCollectionEquality().hash(_item));

  @JsonKey(ignore: true)
  @override
  _$$_MultiSelectModelCopyWith<_$_MultiSelectModel> get copyWith =>
      __$$_MultiSelectModelCopyWithImpl<_$_MultiSelectModel>(this, _$identity);
}

abstract class _MultiSelectModel implements MultiSelectModel {
  const factory _MultiSelectModel(
      {final bool isSelect, final List<String> item}) = _$_MultiSelectModel;

  @override
  bool get isSelect;
  @override
  List<String> get item;
  @override
  @JsonKey(ignore: true)
  _$$_MultiSelectModelCopyWith<_$_MultiSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}
