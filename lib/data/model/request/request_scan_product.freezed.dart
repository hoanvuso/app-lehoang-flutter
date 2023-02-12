// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_scan_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestScanProduct _$RequestScanProductFromJson(Map<String, dynamic> json) {
  return _RequestScanProduct.fromJson(json);
}

/// @nodoc
class _$RequestScanProductTearOff {
  const _$RequestScanProductTearOff();

  _RequestScanProduct call({String? code, bool? is_confirmed}) {
    return _RequestScanProduct(
      code: code,
      is_confirmed: is_confirmed,
    );
  }

  RequestScanProduct fromJson(Map<String, Object> json) {
    return RequestScanProduct.fromJson(json);
  }
}

/// @nodoc
const $RequestScanProduct = _$RequestScanProductTearOff();

/// @nodoc
mixin _$RequestScanProduct {
  String? get code => throw _privateConstructorUsedError;
  bool? get is_confirmed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestScanProductCopyWith<RequestScanProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestScanProductCopyWith<$Res> {
  factory $RequestScanProductCopyWith(
          RequestScanProduct value, $Res Function(RequestScanProduct) then) =
      _$RequestScanProductCopyWithImpl<$Res>;
  $Res call({String? code, bool? is_confirmed});
}

/// @nodoc
class _$RequestScanProductCopyWithImpl<$Res>
    implements $RequestScanProductCopyWith<$Res> {
  _$RequestScanProductCopyWithImpl(this._value, this._then);

  final RequestScanProduct _value;
  // ignore: unused_field
  final $Res Function(RequestScanProduct) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? is_confirmed = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      is_confirmed: is_confirmed == freezed
          ? _value.is_confirmed
          : is_confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$RequestScanProductCopyWith<$Res>
    implements $RequestScanProductCopyWith<$Res> {
  factory _$RequestScanProductCopyWith(
          _RequestScanProduct value, $Res Function(_RequestScanProduct) then) =
      __$RequestScanProductCopyWithImpl<$Res>;
  @override
  $Res call({String? code, bool? is_confirmed});
}

/// @nodoc
class __$RequestScanProductCopyWithImpl<$Res>
    extends _$RequestScanProductCopyWithImpl<$Res>
    implements _$RequestScanProductCopyWith<$Res> {
  __$RequestScanProductCopyWithImpl(
      _RequestScanProduct _value, $Res Function(_RequestScanProduct) _then)
      : super(_value, (v) => _then(v as _RequestScanProduct));

  @override
  _RequestScanProduct get _value => super._value as _RequestScanProduct;

  @override
  $Res call({
    Object? code = freezed,
    Object? is_confirmed = freezed,
  }) {
    return _then(_RequestScanProduct(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      is_confirmed: is_confirmed == freezed
          ? _value.is_confirmed
          : is_confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestScanProduct implements _RequestScanProduct {
  _$_RequestScanProduct({this.code, this.is_confirmed});

  factory _$_RequestScanProduct.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestScanProductFromJson(json);

  @override
  final String? code;
  @override
  final bool? is_confirmed;

  @override
  String toString() {
    return 'RequestScanProduct(code: $code, is_confirmed: $is_confirmed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestScanProduct &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.is_confirmed, is_confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.is_confirmed, is_confirmed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(is_confirmed);

  @JsonKey(ignore: true)
  @override
  _$RequestScanProductCopyWith<_RequestScanProduct> get copyWith =>
      __$RequestScanProductCopyWithImpl<_RequestScanProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestScanProductToJson(this);
  }
}

abstract class _RequestScanProduct implements RequestScanProduct {
  factory _RequestScanProduct({String? code, bool? is_confirmed}) =
      _$_RequestScanProduct;

  factory _RequestScanProduct.fromJson(Map<String, dynamic> json) =
      _$_RequestScanProduct.fromJson;

  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  bool? get is_confirmed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestScanProductCopyWith<_RequestScanProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
