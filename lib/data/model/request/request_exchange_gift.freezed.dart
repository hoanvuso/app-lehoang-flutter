// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_exchange_gift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestExchangeGift _$RequestExchangeGiftFromJson(Map<String, dynamic> json) {
  return _RequestExchangeGift.fromJson(json);
}

/// @nodoc
class _$RequestExchangeGiftTearOff {
  const _$RequestExchangeGiftTearOff();

  _RequestExchangeGift call({int? qty}) {
    return _RequestExchangeGift(
      qty: qty,
    );
  }

  RequestExchangeGift fromJson(Map<String, Object> json) {
    return RequestExchangeGift.fromJson(json);
  }
}

/// @nodoc
const $RequestExchangeGift = _$RequestExchangeGiftTearOff();

/// @nodoc
mixin _$RequestExchangeGift {
  int? get qty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestExchangeGiftCopyWith<RequestExchangeGift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestExchangeGiftCopyWith<$Res> {
  factory $RequestExchangeGiftCopyWith(
          RequestExchangeGift value, $Res Function(RequestExchangeGift) then) =
      _$RequestExchangeGiftCopyWithImpl<$Res>;
  $Res call({int? qty});
}

/// @nodoc
class _$RequestExchangeGiftCopyWithImpl<$Res>
    implements $RequestExchangeGiftCopyWith<$Res> {
  _$RequestExchangeGiftCopyWithImpl(this._value, this._then);

  final RequestExchangeGift _value;
  // ignore: unused_field
  final $Res Function(RequestExchangeGift) _then;

  @override
  $Res call({
    Object? qty = freezed,
  }) {
    return _then(_value.copyWith(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$RequestExchangeGiftCopyWith<$Res>
    implements $RequestExchangeGiftCopyWith<$Res> {
  factory _$RequestExchangeGiftCopyWith(_RequestExchangeGift value,
          $Res Function(_RequestExchangeGift) then) =
      __$RequestExchangeGiftCopyWithImpl<$Res>;
  @override
  $Res call({int? qty});
}

/// @nodoc
class __$RequestExchangeGiftCopyWithImpl<$Res>
    extends _$RequestExchangeGiftCopyWithImpl<$Res>
    implements _$RequestExchangeGiftCopyWith<$Res> {
  __$RequestExchangeGiftCopyWithImpl(
      _RequestExchangeGift _value, $Res Function(_RequestExchangeGift) _then)
      : super(_value, (v) => _then(v as _RequestExchangeGift));

  @override
  _RequestExchangeGift get _value => super._value as _RequestExchangeGift;

  @override
  $Res call({
    Object? qty = freezed,
  }) {
    return _then(_RequestExchangeGift(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestExchangeGift implements _RequestExchangeGift {
  _$_RequestExchangeGift({this.qty});

  factory _$_RequestExchangeGift.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestExchangeGiftFromJson(json);

  @override
  final int? qty;

  @override
  String toString() {
    return 'RequestExchangeGift(qty: $qty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestExchangeGift &&
            (identical(other.qty, qty) ||
                const DeepCollectionEquality().equals(other.qty, qty)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(qty);

  @JsonKey(ignore: true)
  @override
  _$RequestExchangeGiftCopyWith<_RequestExchangeGift> get copyWith =>
      __$RequestExchangeGiftCopyWithImpl<_RequestExchangeGift>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestExchangeGiftToJson(this);
  }
}

abstract class _RequestExchangeGift implements RequestExchangeGift {
  factory _RequestExchangeGift({int? qty}) = _$_RequestExchangeGift;

  factory _RequestExchangeGift.fromJson(Map<String, dynamic> json) =
      _$_RequestExchangeGift.fromJson;

  @override
  int? get qty => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestExchangeGiftCopyWith<_RequestExchangeGift> get copyWith =>
      throw _privateConstructorUsedError;
}
