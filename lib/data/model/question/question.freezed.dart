// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
class _$QuestionTearOff {
  const _$QuestionTearOff();

  _Question call(
      {Object? image,
      int? is_deleted,
      String? updated_at,
      Object? image_path,
      String? image_url,
      String? name,
      List<Answer>? multi_answer,
      Object? created_at,
      int? id,
      String? body,
      String? point}) {
    return _Question(
      image: image,
      is_deleted: is_deleted,
      updated_at: updated_at,
      image_path: image_path,
      image_url: image_url,
      name: name,
      multi_answer: multi_answer,
      created_at: created_at,
      id: id,
      body: body,
      point: point,
    );
  }

  Question fromJson(Map<String, Object> json) {
    return Question.fromJson(json);
  }
}

/// @nodoc
const $Question = _$QuestionTearOff();

/// @nodoc
mixin _$Question {
  Object? get image => throw _privateConstructorUsedError;
  int? get is_deleted => throw _privateConstructorUsedError;
  String? get updated_at => throw _privateConstructorUsedError;
  Object? get image_path => throw _privateConstructorUsedError;
  String? get image_url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<Answer>? get multi_answer => throw _privateConstructorUsedError;
  Object? get created_at => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get point => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {Object? image,
      int? is_deleted,
      String? updated_at,
      Object? image_path,
      String? image_url,
      String? name,
      List<Answer>? multi_answer,
      Object? created_at,
      int? id,
      String? body,
      String? point});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? is_deleted = freezed,
    Object? updated_at = freezed,
    Object? image_path = freezed,
    Object? image_url = freezed,
    Object? name = freezed,
    Object? multi_answer = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? body = freezed,
    Object? point = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed ? _value.image : image,
      is_deleted: is_deleted == freezed
          ? _value.is_deleted
          : is_deleted // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      image_path: image_path == freezed ? _value.image_path : image_path,
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      multi_answer: multi_answer == freezed
          ? _value.multi_answer
          : multi_answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) then) =
      __$QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {Object? image,
      int? is_deleted,
      String? updated_at,
      Object? image_path,
      String? image_url,
      String? name,
      List<Answer>? multi_answer,
      Object? created_at,
      int? id,
      String? body,
      String? point});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(_Question _value, $Res Function(_Question) _then)
      : super(_value, (v) => _then(v as _Question));

  @override
  _Question get _value => super._value as _Question;

  @override
  $Res call({
    Object? image = freezed,
    Object? is_deleted = freezed,
    Object? updated_at = freezed,
    Object? image_path = freezed,
    Object? image_url = freezed,
    Object? name = freezed,
    Object? multi_answer = freezed,
    Object? created_at = freezed,
    Object? id = freezed,
    Object? body = freezed,
    Object? point = freezed,
  }) {
    return _then(_Question(
      image: image == freezed ? _value.image : image,
      is_deleted: is_deleted == freezed
          ? _value.is_deleted
          : is_deleted // ignore: cast_nullable_to_non_nullable
              as int?,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      image_path: image_path == freezed ? _value.image_path : image_path,
      image_url: image_url == freezed
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      multi_answer: multi_answer == freezed
          ? _value.multi_answer
          : multi_answer // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
      created_at: created_at == freezed ? _value.created_at : created_at,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Question implements _Question {
  _$_Question(
      {this.image,
      this.is_deleted,
      this.updated_at,
      this.image_path,
      this.image_url,
      this.name,
      this.multi_answer,
      this.created_at,
      this.id,
      this.body,
      this.point});

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionFromJson(json);

  @override
  final Object? image;
  @override
  final int? is_deleted;
  @override
  final String? updated_at;
  @override
  final Object? image_path;
  @override
  final String? image_url;
  @override
  final String? name;
  @override
  final List<Answer>? multi_answer;
  @override
  final Object? created_at;
  @override
  final int? id;
  @override
  final String? body;
  @override
  final String? point;

  @override
  String toString() {
    return 'Question(image: $image, is_deleted: $is_deleted, updated_at: $updated_at, image_path: $image_path, image_url: $image_url, name: $name, multi_answer: $multi_answer, created_at: $created_at, id: $id, body: $body, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Question &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.is_deleted, is_deleted) ||
                const DeepCollectionEquality()
                    .equals(other.is_deleted, is_deleted)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.image_path, image_path) ||
                const DeepCollectionEquality()
                    .equals(other.image_path, image_path)) &&
            (identical(other.image_url, image_url) ||
                const DeepCollectionEquality()
                    .equals(other.image_url, image_url)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.multi_answer, multi_answer) ||
                const DeepCollectionEquality()
                    .equals(other.multi_answer, multi_answer)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(is_deleted) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(image_path) ^
      const DeepCollectionEquality().hash(image_url) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(multi_answer) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionToJson(this);
  }
}

abstract class _Question implements Question {
  factory _Question(
      {Object? image,
      int? is_deleted,
      String? updated_at,
      Object? image_path,
      String? image_url,
      String? name,
      List<Answer>? multi_answer,
      Object? created_at,
      int? id,
      String? body,
      String? point}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  Object? get image => throw _privateConstructorUsedError;
  @override
  int? get is_deleted => throw _privateConstructorUsedError;
  @override
  String? get updated_at => throw _privateConstructorUsedError;
  @override
  Object? get image_path => throw _privateConstructorUsedError;
  @override
  String? get image_url => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  List<Answer>? get multi_answer => throw _privateConstructorUsedError;
  @override
  Object? get created_at => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get body => throw _privateConstructorUsedError;
  @override
  String? get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuestionCopyWith<_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
