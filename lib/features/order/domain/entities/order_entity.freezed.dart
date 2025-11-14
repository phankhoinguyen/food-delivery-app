// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) {
  return _OrderEntity.fromJson(json);
}

/// @nodoc
mixin _$OrderEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get preparationStatus => throw _privateConstructorUsedError;
  String? get userToken => throw _privateConstructorUsedError;
  List<OrderItemEntity> get items => throw _privateConstructorUsedError;
  FirestoreTimestamp get createdAt => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  FirestoreTimestamp get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderEntityCopyWith<OrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEntityCopyWith<$Res> {
  factory $OrderEntityCopyWith(
    OrderEntity value,
    $Res Function(OrderEntity) then,
  ) = _$OrderEntityCopyWithImpl<$Res, OrderEntity>;
  @useResult
  $Res call({
    String id,
    String userId,
    String orderId,
    int amount,
    String paymentMethod,
    String preparationStatus,
    String? userToken,
    List<OrderItemEntity> items,
    FirestoreTimestamp createdAt,
    String paymentStatus,
    FirestoreTimestamp updatedAt,
  });

  $FirestoreTimestampCopyWith<$Res> get createdAt;
  $FirestoreTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class _$OrderEntityCopyWithImpl<$Res, $Val extends OrderEntity>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? orderId = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? preparationStatus = null,
    Object? userToken = freezed,
    Object? items = null,
    Object? createdAt = null,
    Object? paymentStatus = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            orderId:
                null == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String,
            amount:
                null == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as int,
            paymentMethod:
                null == paymentMethod
                    ? _value.paymentMethod
                    : paymentMethod // ignore: cast_nullable_to_non_nullable
                        as String,
            preparationStatus:
                null == preparationStatus
                    ? _value.preparationStatus
                    : preparationStatus // ignore: cast_nullable_to_non_nullable
                        as String,
            userToken:
                freezed == userToken
                    ? _value.userToken
                    : userToken // ignore: cast_nullable_to_non_nullable
                        as String?,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<OrderItemEntity>,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as FirestoreTimestamp,
            paymentStatus:
                null == paymentStatus
                    ? _value.paymentStatus
                    : paymentStatus // ignore: cast_nullable_to_non_nullable
                        as String,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as FirestoreTimestamp,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirestoreTimestampCopyWith<$Res> get createdAt {
    return $FirestoreTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirestoreTimestampCopyWith<$Res> get updatedAt {
    return $FirestoreTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderEntityImplCopyWith<$Res>
    implements $OrderEntityCopyWith<$Res> {
  factory _$$OrderEntityImplCopyWith(
    _$OrderEntityImpl value,
    $Res Function(_$OrderEntityImpl) then,
  ) = __$$OrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String orderId,
    int amount,
    String paymentMethod,
    String preparationStatus,
    String? userToken,
    List<OrderItemEntity> items,
    FirestoreTimestamp createdAt,
    String paymentStatus,
    FirestoreTimestamp updatedAt,
  });

  @override
  $FirestoreTimestampCopyWith<$Res> get createdAt;
  @override
  $FirestoreTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class __$$OrderEntityImplCopyWithImpl<$Res>
    extends _$OrderEntityCopyWithImpl<$Res, _$OrderEntityImpl>
    implements _$$OrderEntityImplCopyWith<$Res> {
  __$$OrderEntityImplCopyWithImpl(
    _$OrderEntityImpl _value,
    $Res Function(_$OrderEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? orderId = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? preparationStatus = null,
    Object? userToken = freezed,
    Object? items = null,
    Object? createdAt = null,
    Object? paymentStatus = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$OrderEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        amount:
            null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as int,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String,
        preparationStatus:
            null == preparationStatus
                ? _value.preparationStatus
                : preparationStatus // ignore: cast_nullable_to_non_nullable
                    as String,
        userToken:
            freezed == userToken
                ? _value.userToken
                : userToken // ignore: cast_nullable_to_non_nullable
                    as String?,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<OrderItemEntity>,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as FirestoreTimestamp,
        paymentStatus:
            null == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                    as String,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as FirestoreTimestamp,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderEntityImpl implements _OrderEntity {
  const _$OrderEntityImpl({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
    required this.preparationStatus,
    this.userToken,
    required final List<OrderItemEntity> items,
    required this.createdAt,
    required this.paymentStatus,
    required this.updatedAt,
  }) : _items = items;

  factory _$OrderEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String orderId;
  @override
  final int amount;
  @override
  final String paymentMethod;
  @override
  final String preparationStatus;
  @override
  final String? userToken;
  final List<OrderItemEntity> _items;
  @override
  List<OrderItemEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final FirestoreTimestamp createdAt;
  @override
  final String paymentStatus;
  @override
  final FirestoreTimestamp updatedAt;

  @override
  String toString() {
    return 'OrderEntity(id: $id, userId: $userId, orderId: $orderId, amount: $amount, paymentMethod: $paymentMethod, preparationStatus: $preparationStatus, userToken: $userToken, items: $items, createdAt: $createdAt, paymentStatus: $paymentStatus, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.preparationStatus, preparationStatus) ||
                other.preparationStatus == preparationStatus) &&
            (identical(other.userToken, userToken) ||
                other.userToken == userToken) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    orderId,
    amount,
    paymentMethod,
    preparationStatus,
    userToken,
    const DeepCollectionEquality().hash(_items),
    createdAt,
    paymentStatus,
    updatedAt,
  );

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      __$$OrderEntityImplCopyWithImpl<_$OrderEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderEntityImplToJson(this);
  }
}

abstract class _OrderEntity implements OrderEntity {
  const factory _OrderEntity({
    required final String id,
    required final String userId,
    required final String orderId,
    required final int amount,
    required final String paymentMethod,
    required final String preparationStatus,
    final String? userToken,
    required final List<OrderItemEntity> items,
    required final FirestoreTimestamp createdAt,
    required final String paymentStatus,
    required final FirestoreTimestamp updatedAt,
  }) = _$OrderEntityImpl;

  factory _OrderEntity.fromJson(Map<String, dynamic> json) =
      _$OrderEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get orderId;
  @override
  int get amount;
  @override
  String get paymentMethod;
  @override
  String get preparationStatus;
  @override
  String? get userToken;
  @override
  List<OrderItemEntity> get items;
  @override
  FirestoreTimestamp get createdAt;
  @override
  String get paymentStatus;
  @override
  FirestoreTimestamp get updatedAt;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FirestoreTimestamp _$FirestoreTimestampFromJson(Map<String, dynamic> json) {
  return _FirestoreTimestamp.fromJson(json);
}

/// @nodoc
mixin _$FirestoreTimestamp {
  @JsonKey(name: '_seconds')
  int get seconds => throw _privateConstructorUsedError;
  @JsonKey(name: '_nanoseconds')
  int get nanoseconds => throw _privateConstructorUsedError;

  /// Serializes this FirestoreTimestamp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FirestoreTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirestoreTimestampCopyWith<FirestoreTimestamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreTimestampCopyWith<$Res> {
  factory $FirestoreTimestampCopyWith(
    FirestoreTimestamp value,
    $Res Function(FirestoreTimestamp) then,
  ) = _$FirestoreTimestampCopyWithImpl<$Res, FirestoreTimestamp>;
  @useResult
  $Res call({
    @JsonKey(name: '_seconds') int seconds,
    @JsonKey(name: '_nanoseconds') int nanoseconds,
  });
}

/// @nodoc
class _$FirestoreTimestampCopyWithImpl<$Res, $Val extends FirestoreTimestamp>
    implements $FirestoreTimestampCopyWith<$Res> {
  _$FirestoreTimestampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirestoreTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? seconds = null, Object? nanoseconds = null}) {
    return _then(
      _value.copyWith(
            seconds:
                null == seconds
                    ? _value.seconds
                    : seconds // ignore: cast_nullable_to_non_nullable
                        as int,
            nanoseconds:
                null == nanoseconds
                    ? _value.nanoseconds
                    : nanoseconds // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FirestoreTimestampImplCopyWith<$Res>
    implements $FirestoreTimestampCopyWith<$Res> {
  factory _$$FirestoreTimestampImplCopyWith(
    _$FirestoreTimestampImpl value,
    $Res Function(_$FirestoreTimestampImpl) then,
  ) = __$$FirestoreTimestampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_seconds') int seconds,
    @JsonKey(name: '_nanoseconds') int nanoseconds,
  });
}

/// @nodoc
class __$$FirestoreTimestampImplCopyWithImpl<$Res>
    extends _$FirestoreTimestampCopyWithImpl<$Res, _$FirestoreTimestampImpl>
    implements _$$FirestoreTimestampImplCopyWith<$Res> {
  __$$FirestoreTimestampImplCopyWithImpl(
    _$FirestoreTimestampImpl _value,
    $Res Function(_$FirestoreTimestampImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FirestoreTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? seconds = null, Object? nanoseconds = null}) {
    return _then(
      _$FirestoreTimestampImpl(
        seconds:
            null == seconds
                ? _value.seconds
                : seconds // ignore: cast_nullable_to_non_nullable
                    as int,
        nanoseconds:
            null == nanoseconds
                ? _value.nanoseconds
                : nanoseconds // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FirestoreTimestampImpl implements _FirestoreTimestamp {
  const _$FirestoreTimestampImpl({
    @JsonKey(name: '_seconds') required this.seconds,
    @JsonKey(name: '_nanoseconds') required this.nanoseconds,
  });

  factory _$FirestoreTimestampImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirestoreTimestampImplFromJson(json);

  @override
  @JsonKey(name: '_seconds')
  final int seconds;
  @override
  @JsonKey(name: '_nanoseconds')
  final int nanoseconds;

  @override
  String toString() {
    return 'FirestoreTimestamp(seconds: $seconds, nanoseconds: $nanoseconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreTimestampImpl &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.nanoseconds, nanoseconds) ||
                other.nanoseconds == nanoseconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seconds, nanoseconds);

  /// Create a copy of FirestoreTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreTimestampImplCopyWith<_$FirestoreTimestampImpl> get copyWith =>
      __$$FirestoreTimestampImplCopyWithImpl<_$FirestoreTimestampImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FirestoreTimestampImplToJson(this);
  }
}

abstract class _FirestoreTimestamp implements FirestoreTimestamp {
  const factory _FirestoreTimestamp({
    @JsonKey(name: '_seconds') required final int seconds,
    @JsonKey(name: '_nanoseconds') required final int nanoseconds,
  }) = _$FirestoreTimestampImpl;

  factory _FirestoreTimestamp.fromJson(Map<String, dynamic> json) =
      _$FirestoreTimestampImpl.fromJson;

  @override
  @JsonKey(name: '_seconds')
  int get seconds;
  @override
  @JsonKey(name: '_nanoseconds')
  int get nanoseconds;

  /// Create a copy of FirestoreTimestamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreTimestampImplCopyWith<_$FirestoreTimestampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
