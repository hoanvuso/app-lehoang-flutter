// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_tech_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductTechInformation _$ProductTechInformationFromJson(
    Map<String, dynamic> json) {
  return _ProductTechInformation.fromJson(json);
}

/// @nodoc
class _$ProductTechInformationTearOff {
  const _$ProductTechInformationTearOff();

  _ProductTechInformation call(
      {String? feature_id, String? value, ProductCategoryFeature? feature}) {
    return _ProductTechInformation(
      feature_id: feature_id,
      value: value,
      feature: feature,
    );
  }

  ProductTechInformation fromJson(Map<String, Object> json) {
    return ProductTechInformation.fromJson(json);
  }
}

/// @nodoc
const $ProductTechInformation = _$ProductTechInformationTearOff();

/// @nodoc
mixin _$ProductTechInformation {
  String? get feature_id => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  ProductCategoryFeature? get feature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTechInformationCopyWith<ProductTechInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTechInformationCopyWith<$Res> {
  factory $ProductTechInformationCopyWith(ProductTechInformation value,
          $Res Function(ProductTechInformation) then) =
      _$ProductTechInformationCopyWithImpl<$Res>;
  $Res call(
      {String? feature_id, String? value, ProductCategoryFeature? feature});

  $ProductCategoryFeatureCopyWith<$Res>? get feature;
}

/// @nodoc
class _$ProductTechInformationCopyWithImpl<$Res>
    implements $ProductTechInformationCopyWith<$Res> {
  _$ProductTechInformationCopyWithImpl(this._value, this._then);

  final ProductTechInformation _value;
  // ignore: unused_field
  final $Res Function(ProductTechInformation) _then;

  @override
  $Res call({
    Object? feature_id = freezed,
    Object? value = freezed,
    Object? feature = freezed,
  }) {
    return _then(_value.copyWith(
      feature_id: feature_id == freezed
          ? _value.feature_id
          : feature_id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      feature: feature == freezed
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as ProductCategoryFeature?,
    ));
  }

  @override
  $ProductCategoryFeatureCopyWith<$Res>? get feature {
    if (_value.feature == null) {
      return null;
    }

    return $ProductCategoryFeatureCopyWith<$Res>(_value.feature!, (value) {
      return _then(_value.copyWith(feature: value));
    });
  }
}

/// @nodoc
abstract class _$ProductTechInformationCopyWith<$Res>
    implements $ProductTechInformationCopyWith<$Res> {
  factory _$ProductTechInformationCopyWith(_ProductTechInformation value,
          $Res Function(_ProductTechInformation) then) =
      __$ProductTechInformationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? feature_id, String? value, ProductCategoryFeature? feature});

  @override
  $ProductCategoryFeatureCopyWith<$Res>? get feature;
}

/// @nodoc
class __$ProductTechInformationCopyWithImpl<$Res>
    extends _$ProductTechInformationCopyWithImpl<$Res>
    implements _$ProductTechInformationCopyWith<$Res> {
  __$ProductTechInformationCopyWithImpl(_ProductTechInformation _value,
      $Res Function(_ProductTechInformation) _then)
      : super(_value, (v) => _then(v as _ProductTechInformation));

  @override
  _ProductTechInformation get _value => super._value as _ProductTechInformation;

  @override
  $Res call({
    Object? feature_id = freezed,
    Object? value = freezed,
    Object? feature = freezed,
  }) {
    return _then(_ProductTechInformation(
      feature_id: feature_id == freezed
          ? _value.feature_id
          : feature_id // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      feature: feature == freezed
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as ProductCategoryFeature?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProductTechInformation implements _ProductTechInformation {
  _$_ProductTechInformation({this.feature_id, this.value, this.feature});

  factory _$_ProductTechInformation.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductTechInformationFromJson(json);

  @override
  final String? feature_id;
  @override
  final String? value;
  @override
  final ProductCategoryFeature? feature;

  @override
  String toString() {
    return 'ProductTechInformation(feature_id: $feature_id, value: $value, feature: $feature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductTechInformation &&
            (identical(other.feature_id, feature_id) ||
                const DeepCollectionEquality()
                    .equals(other.feature_id, feature_id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.feature, feature) ||
                const DeepCollectionEquality().equals(other.feature, feature)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(feature_id) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(feature);

  @JsonKey(ignore: true)
  @override
  _$ProductTechInformationCopyWith<_ProductTechInformation> get copyWith =>
      __$ProductTechInformationCopyWithImpl<_ProductTechInformation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductTechInformationToJson(this);
  }
}

abstract class _ProductTechInformation implements ProductTechInformation {
  factory _ProductTechInformation(
      {String? feature_id,
      String? value,
      ProductCategoryFeature? feature}) = _$_ProductTechInformation;

  factory _ProductTechInformation.fromJson(Map<String, dynamic> json) =
      _$_ProductTechInformation.fromJson;

  @override
  String? get feature_id => throw _privateConstructorUsedError;
  @override
  String? get value => throw _privateConstructorUsedError;
  @override
  ProductCategoryFeature? get feature => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductTechInformationCopyWith<_ProductTechInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
