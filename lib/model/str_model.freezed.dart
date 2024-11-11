// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'str_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StrModel _$StrModelFromJson(Map<String, dynamic> json) {
  return _StrModel.fromJson(json);
}

/// @nodoc
mixin _$StrModel {
  String get str => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get usedAt => throw _privateConstructorUsedError;
  DateTime? get pickedAt => throw _privateConstructorUsedError;

  /// Serializes this StrModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrModelCopyWith<StrModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrModelCopyWith<$Res> {
  factory $StrModelCopyWith(StrModel value, $Res Function(StrModel) then) =
      _$StrModelCopyWithImpl<$Res, StrModel>;
  @useResult
  $Res call(
      {String str, DateTime? createdAt, DateTime? usedAt, DateTime? pickedAt});
}

/// @nodoc
class _$StrModelCopyWithImpl<$Res, $Val extends StrModel>
    implements $StrModelCopyWith<$Res> {
  _$StrModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? str = null,
    Object? createdAt = freezed,
    Object? usedAt = freezed,
    Object? pickedAt = freezed,
  }) {
    return _then(_value.copyWith(
      str: null == str
          ? _value.str
          : str // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedAt: freezed == pickedAt
          ? _value.pickedAt
          : pickedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrModelImplCopyWith<$Res>
    implements $StrModelCopyWith<$Res> {
  factory _$$StrModelImplCopyWith(
          _$StrModelImpl value, $Res Function(_$StrModelImpl) then) =
      __$$StrModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String str, DateTime? createdAt, DateTime? usedAt, DateTime? pickedAt});
}

/// @nodoc
class __$$StrModelImplCopyWithImpl<$Res>
    extends _$StrModelCopyWithImpl<$Res, _$StrModelImpl>
    implements _$$StrModelImplCopyWith<$Res> {
  __$$StrModelImplCopyWithImpl(
      _$StrModelImpl _value, $Res Function(_$StrModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StrModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? str = null,
    Object? createdAt = freezed,
    Object? usedAt = freezed,
    Object? pickedAt = freezed,
  }) {
    return _then(_$StrModelImpl(
      str: null == str
          ? _value.str
          : str // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedAt: freezed == pickedAt
          ? _value.pickedAt
          : pickedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrModelImpl implements _StrModel {
  const _$StrModelImpl(
      {required this.str, this.createdAt, this.usedAt, this.pickedAt});

  factory _$StrModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrModelImplFromJson(json);

  @override
  final String str;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? usedAt;
  @override
  final DateTime? pickedAt;

  @override
  String toString() {
    return 'StrModel(str: $str, createdAt: $createdAt, usedAt: $usedAt, pickedAt: $pickedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrModelImpl &&
            (identical(other.str, str) || other.str == str) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.pickedAt, pickedAt) ||
                other.pickedAt == pickedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, str, createdAt, usedAt, pickedAt);

  /// Create a copy of StrModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrModelImplCopyWith<_$StrModelImpl> get copyWith =>
      __$$StrModelImplCopyWithImpl<_$StrModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrModelImplToJson(
      this,
    );
  }
}

abstract class _StrModel implements StrModel {
  const factory _StrModel(
      {required final String str,
      final DateTime? createdAt,
      final DateTime? usedAt,
      final DateTime? pickedAt}) = _$StrModelImpl;

  factory _StrModel.fromJson(Map<String, dynamic> json) =
      _$StrModelImpl.fromJson;

  @override
  String get str;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get usedAt;
  @override
  DateTime? get pickedAt;

  /// Create a copy of StrModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrModelImplCopyWith<_$StrModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
