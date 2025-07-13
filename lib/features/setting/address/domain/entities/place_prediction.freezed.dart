// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlacePrediction _$PlacePredictionFromJson(Map<String, dynamic> json) {
  return _PlacePrediction.fromJson(json);
}

/// @nodoc
mixin _$PlacePrediction {
  String get placeId => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get formattedAddress => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PlacePrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlacePrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacePredictionCopyWith<PlacePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePredictionCopyWith<$Res> {
  factory $PlacePredictionCopyWith(
    PlacePrediction value,
    $Res Function(PlacePrediction) then,
  ) = _$PlacePredictionCopyWithImpl<$Res, PlacePrediction>;
  @useResult
  $Res call({
    String placeId,
    String displayName,
    String formattedAddress,
    String uid,
    bool? isDefault,
    String? type,
    String? lat,
    String? description,
    String? long,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$PlacePredictionCopyWithImpl<$Res, $Val extends PlacePrediction>
    implements $PlacePredictionCopyWith<$Res> {
  _$PlacePredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacePrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? displayName = null,
    Object? formattedAddress = null,
    Object? uid = null,
    Object? isDefault = freezed,
    Object? type = freezed,
    Object? lat = freezed,
    Object? description = freezed,
    Object? long = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            placeId:
                null == placeId
                    ? _value.placeId
                    : placeId // ignore: cast_nullable_to_non_nullable
                        as String,
            displayName:
                null == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String,
            formattedAddress:
                null == formattedAddress
                    ? _value.formattedAddress
                    : formattedAddress // ignore: cast_nullable_to_non_nullable
                        as String,
            uid:
                null == uid
                    ? _value.uid
                    : uid // ignore: cast_nullable_to_non_nullable
                        as String,
            isDefault:
                freezed == isDefault
                    ? _value.isDefault
                    : isDefault // ignore: cast_nullable_to_non_nullable
                        as bool?,
            type:
                freezed == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String?,
            lat:
                freezed == lat
                    ? _value.lat
                    : lat // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            long:
                freezed == long
                    ? _value.long
                    : long // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlacePredictionImplCopyWith<$Res>
    implements $PlacePredictionCopyWith<$Res> {
  factory _$$PlacePredictionImplCopyWith(
    _$PlacePredictionImpl value,
    $Res Function(_$PlacePredictionImpl) then,
  ) = __$$PlacePredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String placeId,
    String displayName,
    String formattedAddress,
    String uid,
    bool? isDefault,
    String? type,
    String? lat,
    String? description,
    String? long,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$PlacePredictionImplCopyWithImpl<$Res>
    extends _$PlacePredictionCopyWithImpl<$Res, _$PlacePredictionImpl>
    implements _$$PlacePredictionImplCopyWith<$Res> {
  __$$PlacePredictionImplCopyWithImpl(
    _$PlacePredictionImpl _value,
    $Res Function(_$PlacePredictionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacePrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? displayName = null,
    Object? formattedAddress = null,
    Object? uid = null,
    Object? isDefault = freezed,
    Object? type = freezed,
    Object? lat = freezed,
    Object? description = freezed,
    Object? long = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$PlacePredictionImpl(
        placeId:
            null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                    as String,
        displayName:
            null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String,
        formattedAddress:
            null == formattedAddress
                ? _value.formattedAddress
                : formattedAddress // ignore: cast_nullable_to_non_nullable
                    as String,
        uid:
            null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                    as String,
        isDefault:
            freezed == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                    as bool?,
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String?,
        lat:
            freezed == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        long:
            freezed == long
                ? _value.long
                : long // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacePredictionImpl implements _PlacePrediction {
  const _$PlacePredictionImpl({
    required this.placeId,
    required this.displayName,
    required this.formattedAddress,
    required this.uid,
    this.isDefault = false,
    this.type,
    this.lat,
    this.description,
    this.long,
    this.createdAt,
    this.updatedAt,
  });

  factory _$PlacePredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacePredictionImplFromJson(json);

  @override
  final String placeId;
  @override
  final String displayName;
  @override
  final String formattedAddress;
  @override
  final String uid;
  @override
  @JsonKey()
  final bool? isDefault;
  @override
  final String? type;
  @override
  final String? lat;
  @override
  final String? description;
  @override
  final String? long;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PlacePrediction(placeId: $placeId, displayName: $displayName, formattedAddress: $formattedAddress, uid: $uid, isDefault: $isDefault, type: $type, lat: $lat, description: $description, long: $long, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacePredictionImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    placeId,
    displayName,
    formattedAddress,
    uid,
    isDefault,
    type,
    lat,
    description,
    long,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PlacePrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacePredictionImplCopyWith<_$PlacePredictionImpl> get copyWith =>
      __$$PlacePredictionImplCopyWithImpl<_$PlacePredictionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacePredictionImplToJson(this);
  }
}

abstract class _PlacePrediction implements PlacePrediction {
  const factory _PlacePrediction({
    required final String placeId,
    required final String displayName,
    required final String formattedAddress,
    required final String uid,
    final bool? isDefault,
    final String? type,
    final String? lat,
    final String? description,
    final String? long,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$PlacePredictionImpl;

  factory _PlacePrediction.fromJson(Map<String, dynamic> json) =
      _$PlacePredictionImpl.fromJson;

  @override
  String get placeId;
  @override
  String get displayName;
  @override
  String get formattedAddress;
  @override
  String get uid;
  @override
  bool? get isDefault;
  @override
  String? get type;
  @override
  String? get lat;
  @override
  String? get description;
  @override
  String? get long;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PlacePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacePredictionImplCopyWith<_$PlacePredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
