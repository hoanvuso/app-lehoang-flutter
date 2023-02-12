// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
class _$SurveyTearOff {
  const _$SurveyTearOff();

  _Survey call({List<Question>? data, int? survey_id, Object? point}) {
    return _Survey(
      data: data,
      survey_id: survey_id,
      point: point,
    );
  }

  Survey fromJson(Map<String, Object> json) {
    return Survey.fromJson(json);
  }
}

/// @nodoc
const $Survey = _$SurveyTearOff();

/// @nodoc
mixin _$Survey {
  List<Question>? get data => throw _privateConstructorUsedError;
  int? get survey_id => throw _privateConstructorUsedError;
  Object? get point => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res>;
  $Res call({List<Question>? data, int? survey_id, Object? point});
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res> implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  final Survey _value;
  // ignore: unused_field
  final $Res Function(Survey) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? survey_id = freezed,
    Object? point = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      survey_id: survey_id == freezed
          ? _value.survey_id
          : survey_id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed ? _value.point : point,
    ));
  }
}

/// @nodoc
abstract class _$SurveyCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$SurveyCopyWith(_Survey value, $Res Function(_Survey) then) =
      __$SurveyCopyWithImpl<$Res>;
  @override
  $Res call({List<Question>? data, int? survey_id, Object? point});
}

/// @nodoc
class __$SurveyCopyWithImpl<$Res> extends _$SurveyCopyWithImpl<$Res>
    implements _$SurveyCopyWith<$Res> {
  __$SurveyCopyWithImpl(_Survey _value, $Res Function(_Survey) _then)
      : super(_value, (v) => _then(v as _Survey));

  @override
  _Survey get _value => super._value as _Survey;

  @override
  $Res call({
    Object? data = freezed,
    Object? survey_id = freezed,
    Object? point = freezed,
  }) {
    return _then(_Survey(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      survey_id: survey_id == freezed
          ? _value.survey_id
          : survey_id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed ? _value.point : point,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Survey implements _Survey {
  _$_Survey({this.data, this.survey_id, this.point});

  factory _$_Survey.fromJson(Map<String, dynamic> json) =>
      _$_$_SurveyFromJson(json);

  @override
  final List<Question>? data;
  @override
  final int? survey_id;
  @override
  final Object? point;

  @override
  String toString() {
    return 'Survey(data: $data, survey_id: $survey_id, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Survey &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.survey_id, survey_id) ||
                const DeepCollectionEquality()
                    .equals(other.survey_id, survey_id)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(survey_id) ^
      const DeepCollectionEquality().hash(point);

  @JsonKey(ignore: true)
  @override
  _$SurveyCopyWith<_Survey> get copyWith =>
      __$SurveyCopyWithImpl<_Survey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SurveyToJson(this);
  }
}

abstract class _Survey implements Survey {
  factory _Survey({List<Question>? data, int? survey_id, Object? point}) =
      _$_Survey;

  factory _Survey.fromJson(Map<String, dynamic> json) = _$_Survey.fromJson;

  @override
  List<Question>? get data => throw _privateConstructorUsedError;
  @override
  int? get survey_id => throw _privateConstructorUsedError;
  @override
  Object? get point => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SurveyCopyWith<_Survey> get copyWith => throw _privateConstructorUsedError;
}
