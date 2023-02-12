// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'response_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseAnswer _$ResponseAnswerFromJson(Map<String, dynamic> json) {
  return _ResponseAnswer.fromJson(json);
}

/// @nodoc
class _$ResponseAnswerTearOff {
  const _$ResponseAnswerTearOff();

  _ResponseAnswer call({int? numberCorrect, int? point}) {
    return _ResponseAnswer(
      numberCorrect: numberCorrect,
      point: point,
    );
  }

  ResponseAnswer fromJson(Map<String, Object> json) {
    return ResponseAnswer.fromJson(json);
  }
}

/// @nodoc
const $ResponseAnswer = _$ResponseAnswerTearOff();

/// @nodoc
mixin _$ResponseAnswer {
  int? get numberCorrect => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseAnswerCopyWith<ResponseAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseAnswerCopyWith<$Res> {
  factory $ResponseAnswerCopyWith(
          ResponseAnswer value, $Res Function(ResponseAnswer) then) =
      _$ResponseAnswerCopyWithImpl<$Res>;
  $Res call({int? numberCorrect, int? point});
}

/// @nodoc
class _$ResponseAnswerCopyWithImpl<$Res>
    implements $ResponseAnswerCopyWith<$Res> {
  _$ResponseAnswerCopyWithImpl(this._value, this._then);

  final ResponseAnswer _value;
  // ignore: unused_field
  final $Res Function(ResponseAnswer) _then;

  @override
  $Res call({
    Object? numberCorrect = freezed,
    Object? point = freezed,
  }) {
    return _then(_value.copyWith(
      numberCorrect: numberCorrect == freezed
          ? _value.numberCorrect
          : numberCorrect // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ResponseAnswerCopyWith<$Res>
    implements $ResponseAnswerCopyWith<$Res> {
  factory _$ResponseAnswerCopyWith(
          _ResponseAnswer value, $Res Function(_ResponseAnswer) then) =
      __$ResponseAnswerCopyWithImpl<$Res>;
  @override
  $Res call({int? numberCorrect, int? point});
}

/// @nodoc
class __$ResponseAnswerCopyWithImpl<$Res>
    extends _$ResponseAnswerCopyWithImpl<$Res>
    implements _$ResponseAnswerCopyWith<$Res> {
  __$ResponseAnswerCopyWithImpl(
      _ResponseAnswer _value, $Res Function(_ResponseAnswer) _then)
      : super(_value, (v) => _then(v as _ResponseAnswer));

  @override
  _ResponseAnswer get _value => super._value as _ResponseAnswer;

  @override
  $Res call({
    Object? numberCorrect = freezed,
    Object? point = freezed,
  }) {
    return _then(_ResponseAnswer(
      numberCorrect: numberCorrect == freezed
          ? _value.numberCorrect
          : numberCorrect // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ResponseAnswer implements _ResponseAnswer {
  _$_ResponseAnswer({this.numberCorrect, this.point});

  factory _$_ResponseAnswer.fromJson(Map<String, dynamic> json) =>
      _$_$_ResponseAnswerFromJson(json);

  @override
  final int? numberCorrect;
  @override
  final int? point;

  @override
  String toString() {
    return 'ResponseAnswer(numberCorrect: $numberCorrect, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResponseAnswer &&
            (identical(other.numberCorrect, numberCorrect) ||
                const DeepCollectionEquality()
                    .equals(other.numberCorrect, numberCorrect)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(numberCorrect) ^
      const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$ResponseAnswerCopyWith<_ResponseAnswer> get copyWith =>
      __$ResponseAnswerCopyWithImpl<_ResponseAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResponseAnswerToJson(this);
  }
}

abstract class _ResponseAnswer implements ResponseAnswer {
  factory _ResponseAnswer({int? numberCorrect, int? point}) = _$_ResponseAnswer;

  factory _ResponseAnswer.fromJson(Map<String, dynamic> json) =
      _$_ResponseAnswer.fromJson;

  @override
  int? get numberCorrect => throw _privateConstructorUsedError;
  @override
  int? get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResponseAnswerCopyWith<_ResponseAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
