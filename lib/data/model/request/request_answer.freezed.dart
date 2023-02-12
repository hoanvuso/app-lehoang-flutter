// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestAnswer _$RequestAnswerFromJson(Map<String, dynamic> json) {
  return _RequestAnswer.fromJson(json);
}

/// @nodoc
class _$RequestAnswerTearOff {
  const _$RequestAnswerTearOff();

  _RequestAnswer call({int? survey_id, List<RequestAnswerChoice>? choices}) {
    return _RequestAnswer(
      survey_id: survey_id,
      choices: choices,
    );
  }

  RequestAnswer fromJson(Map<String, Object> json) {
    return RequestAnswer.fromJson(json);
  }
}

/// @nodoc
const $RequestAnswer = _$RequestAnswerTearOff();

/// @nodoc
mixin _$RequestAnswer {
  int? get survey_id => throw _privateConstructorUsedError;
  List<RequestAnswerChoice>? get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestAnswerCopyWith<RequestAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestAnswerCopyWith<$Res> {
  factory $RequestAnswerCopyWith(
          RequestAnswer value, $Res Function(RequestAnswer) then) =
      _$RequestAnswerCopyWithImpl<$Res>;
  $Res call({int? survey_id, List<RequestAnswerChoice>? choices});
}

/// @nodoc
class _$RequestAnswerCopyWithImpl<$Res>
    implements $RequestAnswerCopyWith<$Res> {
  _$RequestAnswerCopyWithImpl(this._value, this._then);

  final RequestAnswer _value;
  // ignore: unused_field
  final $Res Function(RequestAnswer) _then;

  @override
  $Res call({
    Object? survey_id = freezed,
    Object? choices = freezed,
  }) {
    return _then(_value.copyWith(
      survey_id: survey_id == freezed
          ? _value.survey_id
          : survey_id // ignore: cast_nullable_to_non_nullable
              as int?,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<RequestAnswerChoice>?,
    ));
  }
}

/// @nodoc
abstract class _$RequestAnswerCopyWith<$Res>
    implements $RequestAnswerCopyWith<$Res> {
  factory _$RequestAnswerCopyWith(
          _RequestAnswer value, $Res Function(_RequestAnswer) then) =
      __$RequestAnswerCopyWithImpl<$Res>;
  @override
  $Res call({int? survey_id, List<RequestAnswerChoice>? choices});
}

/// @nodoc
class __$RequestAnswerCopyWithImpl<$Res>
    extends _$RequestAnswerCopyWithImpl<$Res>
    implements _$RequestAnswerCopyWith<$Res> {
  __$RequestAnswerCopyWithImpl(
      _RequestAnswer _value, $Res Function(_RequestAnswer) _then)
      : super(_value, (v) => _then(v as _RequestAnswer));

  @override
  _RequestAnswer get _value => super._value as _RequestAnswer;

  @override
  $Res call({
    Object? survey_id = freezed,
    Object? choices = freezed,
  }) {
    return _then(_RequestAnswer(
      survey_id: survey_id == freezed
          ? _value.survey_id
          : survey_id // ignore: cast_nullable_to_non_nullable
              as int?,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<RequestAnswerChoice>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestAnswer implements _RequestAnswer {
  _$_RequestAnswer({this.survey_id, this.choices});

  factory _$_RequestAnswer.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestAnswerFromJson(json);

  @override
  final int? survey_id;
  @override
  final List<RequestAnswerChoice>? choices;

  @override
  String toString() {
    return 'RequestAnswer(survey_id: $survey_id, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestAnswer &&
            (identical(other.survey_id, survey_id) ||
                const DeepCollectionEquality()
                    .equals(other.survey_id, survey_id)) &&
            (identical(other.choices, choices) ||
                const DeepCollectionEquality().equals(other.choices, choices)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(survey_id) ^
      const DeepCollectionEquality().hash(choices);

  @JsonKey(ignore: true)
  @override
  _$RequestAnswerCopyWith<_RequestAnswer> get copyWith =>
      __$RequestAnswerCopyWithImpl<_RequestAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestAnswerToJson(this);
  }
}

abstract class _RequestAnswer implements RequestAnswer {
  factory _RequestAnswer({int? survey_id, List<RequestAnswerChoice>? choices}) =
      _$_RequestAnswer;

  factory _RequestAnswer.fromJson(Map<String, dynamic> json) =
      _$_RequestAnswer.fromJson;

  @override
  int? get survey_id => throw _privateConstructorUsedError;
  @override
  List<RequestAnswerChoice>? get choices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestAnswerCopyWith<_RequestAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
