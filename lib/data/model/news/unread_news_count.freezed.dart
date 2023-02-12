// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'unread_news_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnreadNewsCount _$UnreadNewsCountFromJson(Map<String, dynamic> json) {
  return _UnreadNewsCount.fromJson(json);
}

/// @nodoc
class _$UnreadNewsCountTearOff {
  const _$UnreadNewsCountTearOff();

  _UnreadNewsCount call({int? all, int? tech, int? active, int? promotion}) {
    return _UnreadNewsCount(
      all: all,
      tech: tech,
      active: active,
      promotion: promotion,
    );
  }

  UnreadNewsCount fromJson(Map<String, Object> json) {
    return UnreadNewsCount.fromJson(json);
  }
}

/// @nodoc
const $UnreadNewsCount = _$UnreadNewsCountTearOff();

/// @nodoc
mixin _$UnreadNewsCount {
  int? get all => throw _privateConstructorUsedError;
  int? get tech => throw _privateConstructorUsedError;
  int? get active => throw _privateConstructorUsedError;
  int? get promotion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnreadNewsCountCopyWith<UnreadNewsCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadNewsCountCopyWith<$Res> {
  factory $UnreadNewsCountCopyWith(
          UnreadNewsCount value, $Res Function(UnreadNewsCount) then) =
      _$UnreadNewsCountCopyWithImpl<$Res>;
  $Res call({int? all, int? tech, int? active, int? promotion});
}

/// @nodoc
class _$UnreadNewsCountCopyWithImpl<$Res>
    implements $UnreadNewsCountCopyWith<$Res> {
  _$UnreadNewsCountCopyWithImpl(this._value, this._then);

  final UnreadNewsCount _value;
  // ignore: unused_field
  final $Res Function(UnreadNewsCount) _then;

  @override
  $Res call({
    Object? all = freezed,
    Object? tech = freezed,
    Object? active = freezed,
    Object? promotion = freezed,
  }) {
    return _then(_value.copyWith(
      all: all == freezed
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as int?,
      tech: tech == freezed
          ? _value.tech
          : tech // ignore: cast_nullable_to_non_nullable
              as int?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
      promotion: promotion == freezed
          ? _value.promotion
          : promotion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnreadNewsCountCopyWith<$Res>
    implements $UnreadNewsCountCopyWith<$Res> {
  factory _$UnreadNewsCountCopyWith(
          _UnreadNewsCount value, $Res Function(_UnreadNewsCount) then) =
      __$UnreadNewsCountCopyWithImpl<$Res>;
  @override
  $Res call({int? all, int? tech, int? active, int? promotion});
}

/// @nodoc
class __$UnreadNewsCountCopyWithImpl<$Res>
    extends _$UnreadNewsCountCopyWithImpl<$Res>
    implements _$UnreadNewsCountCopyWith<$Res> {
  __$UnreadNewsCountCopyWithImpl(
      _UnreadNewsCount _value, $Res Function(_UnreadNewsCount) _then)
      : super(_value, (v) => _then(v as _UnreadNewsCount));

  @override
  _UnreadNewsCount get _value => super._value as _UnreadNewsCount;

  @override
  $Res call({
    Object? all = freezed,
    Object? tech = freezed,
    Object? active = freezed,
    Object? promotion = freezed,
  }) {
    return _then(_UnreadNewsCount(
      all: all == freezed
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as int?,
      tech: tech == freezed
          ? _value.tech
          : tech // ignore: cast_nullable_to_non_nullable
              as int?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
      promotion: promotion == freezed
          ? _value.promotion
          : promotion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UnreadNewsCount implements _UnreadNewsCount {
  _$_UnreadNewsCount({this.all, this.tech, this.active, this.promotion});

  factory _$_UnreadNewsCount.fromJson(Map<String, dynamic> json) =>
      _$_$_UnreadNewsCountFromJson(json);

  @override
  final int? all;
  @override
  final int? tech;
  @override
  final int? active;
  @override
  final int? promotion;

  @override
  String toString() {
    return 'UnreadNewsCount(all: $all, tech: $tech, active: $active, promotion: $promotion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnreadNewsCount &&
            (identical(other.all, all) ||
                const DeepCollectionEquality().equals(other.all, all)) &&
            (identical(other.tech, tech) ||
                const DeepCollectionEquality().equals(other.tech, tech)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.promotion, promotion) ||
                const DeepCollectionEquality()
                    .equals(other.promotion, promotion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(all) ^
      const DeepCollectionEquality().hash(tech) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(promotion);

  @JsonKey(ignore: true)
  @override
  _$UnreadNewsCountCopyWith<_UnreadNewsCount> get copyWith =>
      __$UnreadNewsCountCopyWithImpl<_UnreadNewsCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UnreadNewsCountToJson(this);
  }
}

abstract class _UnreadNewsCount implements UnreadNewsCount {
  factory _UnreadNewsCount({int? all, int? tech, int? active, int? promotion}) =
      _$_UnreadNewsCount;

  factory _UnreadNewsCount.fromJson(Map<String, dynamic> json) =
      _$_UnreadNewsCount.fromJson;

  @override
  int? get all => throw _privateConstructorUsedError;
  @override
  int? get tech => throw _privateConstructorUsedError;
  @override
  int? get active => throw _privateConstructorUsedError;
  @override
  int? get promotion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnreadNewsCountCopyWith<_UnreadNewsCount> get copyWith =>
      throw _privateConstructorUsedError;
}
