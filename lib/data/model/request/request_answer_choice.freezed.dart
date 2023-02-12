// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_answer_choice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestAnswerChoice _$RequestAnswerChoiceFromJson(Map<String, dynamic> json) {
  return _RequestAnswerChoice.fromJson(json);
}

/// @nodoc
class _$RequestAnswerChoiceTearOff {
  const _$RequestAnswerChoiceTearOff();

  _RequestAnswerChoice call({int? answer_id, int? question_id}) {
    return _RequestAnswerChoice(
      answer_id: answer_id,
      question_id: question_id,
    );
  }

  RequestAnswerChoice fromJson(Map<String, Object> json) {
    return RequestAnswerChoice.fromJson(json);
  }
}

/// @nodoc
const $RequestAnswerChoice = _$RequestAnswerChoiceTearOff();

/// @nodoc
mixin _$RequestAnswerChoice {
  int? get answer_id => throw _privateConstructorUsedError;
  int? get question_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestAnswerChoiceCopyWith<RequestAnswerChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestAnswerChoiceCopyWith<$Res> {
  factory $RequestAnswerChoiceCopyWith(
          RequestAnswerChoice value, $Res Function(RequestAnswerChoice) then) =
      _$RequestAnswerChoiceCopyWithImpl<$Res>;
  $Res call({int? answer_id, int? question_id});
}

/// @nodoc
class _$RequestAnswerChoiceCopyWithImpl<$Res>
    implements $RequestAnswerChoiceCopyWith<$Res> {
  _$RequestAnswerChoiceCopyWithImpl(this._value, this._then);

  final RequestAnswerChoice _value;
  // ignore: unused_field
  final $Res Function(RequestAnswerChoice) _then;

  @override
  $Res call({
    Object? answer_id = freezed,
    Object? question_id = freezed,
  }) {
    return _then(_value.copyWith(
      answer_id: answer_id == freezed
          ? _value.answer_id
          : answer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      question_id: question_id == freezed
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$RequestAnswerChoiceCopyWith<$Res>
    implements $RequestAnswerChoiceCopyWith<$Res> {
  factory _$RequestAnswerChoiceCopyWith(_RequestAnswerChoice value,
          $Res Function(_RequestAnswerChoice) then) =
      __$RequestAnswerChoiceCopyWithImpl<$Res>;
  @override
  $Res call({int? answer_id, int? question_id});
}

/// @nodoc
class __$RequestAnswerChoiceCopyWithImpl<$Res>
    extends _$RequestAnswerChoiceCopyWithImpl<$Res>
    implements _$RequestAnswerChoiceCopyWith<$Res> {
  __$RequestAnswerChoiceCopyWithImpl(
      _RequestAnswerChoice _value, $Res Function(_RequestAnswerChoice) _then)
      : super(_value, (v) => _then(v as _RequestAnswerChoice));

  @override
  _RequestAnswerChoice get _value => super._value as _RequestAnswerChoice;

  @override
  $Res call({
    Object? answer_id = freezed,
    Object? question_id = freezed,
  }) {
    return _then(_RequestAnswerChoice(
      answer_id: answer_id == freezed
          ? _value.answer_id
          : answer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      question_id: question_id == freezed
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestAnswerChoice implements _RequestAnswerChoice {
  _$_RequestAnswerChoice({this.answer_id, this.question_id});

  factory _$_RequestAnswerChoice.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestAnswerChoiceFromJson(json);

  @override
  final int? answer_id;
  @override
  final int? question_id;

  @override
  String toString() {
    return 'RequestAnswerChoice(answer_id: $answer_id, question_id: $question_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestAnswerChoice &&
            (identical(other.answer_id, answer_id) ||
                const DeepCollectionEquality()
                    .equals(other.answer_id, answer_id)) &&
            (identical(other.question_id, question_id) ||
                const DeepCollectionEquality()
                    .equals(other.question_id, question_id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(answer_id) ^
      const DeepCollectionEquality().hash(question_id);

  @JsonKey(ignore: true)
  @override
  _$RequestAnswerChoiceCopyWith<_RequestAnswerChoice> get copyWith =>
      __$RequestAnswerChoiceCopyWithImpl<_RequestAnswerChoice>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestAnswerChoiceToJson(this);
  }
}

abstract class _RequestAnswerChoice implements RequestAnswerChoice {
  factory _RequestAnswerChoice({int? answer_id, int? question_id}) =
      _$_RequestAnswerChoice;

  factory _RequestAnswerChoice.fromJson(Map<String, dynamic> json) =
      _$_RequestAnswerChoice.fromJson;

  @override
  int? get answer_id => throw _privateConstructorUsedError;
  @override
  int? get question_id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestAnswerChoiceCopyWith<_RequestAnswerChoice> get copyWith =>
      throw _privateConstructorUsedError;
}
