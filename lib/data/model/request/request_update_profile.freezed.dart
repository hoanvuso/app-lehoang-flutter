// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'request_update_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestUpdateProfile _$RequestUpdateProfileFromJson(Map<String, dynamic> json) {
  return _RequestUpdateProfile.fromJson(json);
}

/// @nodoc
class _$RequestUpdateProfileTearOff {
  const _$RequestUpdateProfileTearOff();

  _RequestUpdateProfile call(
      {String? birthday,
      String? agency_name,
      String? address,
      String? name,
      String? phone,
      String? email}) {
    return _RequestUpdateProfile(
      birthday: birthday,
      agency_name: agency_name,
      address: address,
      name: name,
      phone: phone,
      email: email,
    );
  }

  RequestUpdateProfile fromJson(Map<String, Object> json) {
    return RequestUpdateProfile.fromJson(json);
  }
}

/// @nodoc
const $RequestUpdateProfile = _$RequestUpdateProfileTearOff();

/// @nodoc
mixin _$RequestUpdateProfile {
  String? get birthday => throw _privateConstructorUsedError;
  String? get agency_name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestUpdateProfileCopyWith<RequestUpdateProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUpdateProfileCopyWith<$Res> {
  factory $RequestUpdateProfileCopyWith(RequestUpdateProfile value,
          $Res Function(RequestUpdateProfile) then) =
      _$RequestUpdateProfileCopyWithImpl<$Res>;
  $Res call(
      {String? birthday,
      String? agency_name,
      String? address,
      String? name,
      String? phone,
      String? email});
}

/// @nodoc
class _$RequestUpdateProfileCopyWithImpl<$Res>
    implements $RequestUpdateProfileCopyWith<$Res> {
  _$RequestUpdateProfileCopyWithImpl(this._value, this._then);

  final RequestUpdateProfile _value;
  // ignore: unused_field
  final $Res Function(RequestUpdateProfile) _then;

  @override
  $Res call({
    Object? birthday = freezed,
    Object? agency_name = freezed,
    Object? address = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      agency_name: agency_name == freezed
          ? _value.agency_name
          : agency_name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestUpdateProfileCopyWith<$Res>
    implements $RequestUpdateProfileCopyWith<$Res> {
  factory _$RequestUpdateProfileCopyWith(_RequestUpdateProfile value,
          $Res Function(_RequestUpdateProfile) then) =
      __$RequestUpdateProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? birthday,
      String? agency_name,
      String? address,
      String? name,
      String? phone,
      String? email});
}

/// @nodoc
class __$RequestUpdateProfileCopyWithImpl<$Res>
    extends _$RequestUpdateProfileCopyWithImpl<$Res>
    implements _$RequestUpdateProfileCopyWith<$Res> {
  __$RequestUpdateProfileCopyWithImpl(
      _RequestUpdateProfile _value, $Res Function(_RequestUpdateProfile) _then)
      : super(_value, (v) => _then(v as _RequestUpdateProfile));

  @override
  _RequestUpdateProfile get _value => super._value as _RequestUpdateProfile;

  @override
  $Res call({
    Object? birthday = freezed,
    Object? agency_name = freezed,
    Object? address = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_RequestUpdateProfile(
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      agency_name: agency_name == freezed
          ? _value.agency_name
          : agency_name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RequestUpdateProfile implements _RequestUpdateProfile {
  _$_RequestUpdateProfile(
      {this.birthday,
      this.agency_name,
      this.address,
      this.name,
      this.phone,
      this.email});

  factory _$_RequestUpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestUpdateProfileFromJson(json);

  @override
  final String? birthday;
  @override
  final String? agency_name;
  @override
  final String? address;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? email;

  @override
  String toString() {
    return 'RequestUpdateProfile(birthday: $birthday, agency_name: $agency_name, address: $address, name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestUpdateProfile &&
            (identical(other.birthday, birthday) ||
                const DeepCollectionEquality()
                    .equals(other.birthday, birthday)) &&
            (identical(other.agency_name, agency_name) ||
                const DeepCollectionEquality()
                    .equals(other.agency_name, agency_name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(birthday) ^
      const DeepCollectionEquality().hash(agency_name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$RequestUpdateProfileCopyWith<_RequestUpdateProfile> get copyWith =>
      __$RequestUpdateProfileCopyWithImpl<_RequestUpdateProfile>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestUpdateProfileToJson(this);
  }
}

abstract class _RequestUpdateProfile implements RequestUpdateProfile {
  factory _RequestUpdateProfile(
      {String? birthday,
      String? agency_name,
      String? address,
      String? name,
      String? phone,
      String? email}) = _$_RequestUpdateProfile;

  factory _RequestUpdateProfile.fromJson(Map<String, dynamic> json) =
      _$_RequestUpdateProfile.fromJson;

  @override
  String? get birthday => throw _privateConstructorUsedError;
  @override
  String? get agency_name => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestUpdateProfileCopyWith<_RequestUpdateProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
