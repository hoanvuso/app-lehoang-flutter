// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
class _$AnswerTearOff {
  const _$AnswerTearOff();

  _Answer call(
      {String? updated_at,
      String? created_at,
      int? id,
      int? sort,
      String? body,
      int? question_id,
      int? is_correct}) {
    return _Answer(
      updated_at: updated_at,
      created_at: created_at,
      id: id,
      sort: sort,
      body: body,
      question_id: question_id,
      is_correct: is_correct,
    );
  }

  Answer fromJson(Map<String, Object> json) {
    return Answer.fromJson(json);
  }
}

/// @nodoc
const $Answer = _$AnswerTearOff();

/// @nodoc
mixin _$Answer {
  String? get updated_at => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get sort => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  int? get question_id => throw _privateConstructorUsedError;
  int? get is_correct => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res>;
  $Res call(
      {String? updated_at,
      String? created_at,
      int? id,
      int? sort,
      String? body,
      int? question_id,
      int? is_correct});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  final Answer _value;
  // ignore: unused_field
  final $Res Function(Answer) _then;

  @override
  $Res call({
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? sort = freezed,
    Object? body = freezed,
    Object? question_id = freezed,
    Object? is_correct = freezed,
  }) {
    return _then(_value.copyWith(
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      question_id: question_id == freezed
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_correct: is_correct == freezed
          ? _value.is_correct
          : is_correct // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$AnswerCopyWith(_Answer value, $Res Function(_Answer) then) =
      __$AnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? updated_at,
      String? created_at,
      int? id,
      int? sort,
      String? body,
      int? question_id,
      int? is_correct});
}

/// @nodoc
class __$AnswerCopyWithImpl<$Res> extends _$AnswerCopyWithImpl<$Res>
    implements _$AnswerCopyWith<$Res> {
  __$AnswerCopyWithImpl(_Answer _value, $Res Function(_Answer) _then)
      : super(_value, (v) => _then(v as _Answer));

  @override
  _Answer get _value => super._value as _Answer;

  @override
  $Res call({
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? sort = freezed,
    Object? body = freezed,
    Object? question_id = freezed,
    Object? is_correct = freezed,
  }) {
    return _then(_Answer(
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      question_id: question_id == freezed
          ? _value.question_id
          : question_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_correct: is_correct == freezed
          ? _value.is_correct
          : is_correct // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Answer implements _Answer {
  _$_Answer(
      {this.updated_at,
      this.created_at,
      this.id,
      this.sort,
      this.body,
      this.question_id,
      this.is_correct});

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$_$_AnswerFromJson(json);

  @override
  final String? updated_at;
  @override
  final String? created_at;
  @override
  final int? id;
  @override
  final int? sort;
  @override
  final String? body;
  @override
  final int? question_id;
  @override
  final int? is_correct;

  @override
  String toString() {
    return 'Answer(updated_at: $updated_at, created_at: $created_at, id: $id, sort: $sort, body: $body, question_id: $question_id, is_correct: $is_correct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Answer &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.question_id, question_id) ||
                const DeepCollectionEquality()
                    .equals(other.question_id, question_id)) &&
            (identical(other.is_correct, is_correct) ||
                const DeepCollectionEquality()
                    .equals(other.is_correct, is_correct)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(sort) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(question_id) ^
      const DeepCollectionEquality().hash(is_correct);

  @JsonKey(ignore: true)
  @override
  _$AnswerCopyWith<_Answer> get copyWith =>
      __$AnswerCopyWithImpl<_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AnswerToJson(this);
  }
}

abstract class _Answer implements Answer {
  factory _Answer(
      {String? updated_at,
      String? created_at,
      int? id,
      int? sort,
      String? body,
      int? question_id,
      int? is_correct}) = _$_Answer;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  String? get updated_at => throw _privateConstructorUsedError;
  @override
  String? get created_at => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  int? get sort => throw _privateConstructorUsedError;
  @override
  String? get body => throw _privateConstructorUsedError;
  @override
  int? get question_id => throw _privateConstructorUsedError;
  @override
  int? get is_correct => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnswerCopyWith<_Answer> get copyWith => throw _privateConstructorUsedError;
}
