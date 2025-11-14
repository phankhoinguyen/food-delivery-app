// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentStatusEvent {
  String get orderId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderId) initializeStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderId)? initializeStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderId)? initializeStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeStatus value) initializeStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeStatus value)? initializeStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeStatus value)? initializeStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of PaymentStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentStatusEventCopyWith<PaymentStatusEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusEventCopyWith<$Res> {
  factory $PaymentStatusEventCopyWith(
    PaymentStatusEvent value,
    $Res Function(PaymentStatusEvent) then,
  ) = _$PaymentStatusEventCopyWithImpl<$Res, PaymentStatusEvent>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class _$PaymentStatusEventCopyWithImpl<$Res, $Val extends PaymentStatusEvent>
    implements $PaymentStatusEventCopyWith<$Res> {
  _$PaymentStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _value.copyWith(
            orderId:
                null == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitializeStatusImplCopyWith<$Res>
    implements $PaymentStatusEventCopyWith<$Res> {
  factory _$$InitializeStatusImplCopyWith(
    _$InitializeStatusImpl value,
    $Res Function(_$InitializeStatusImpl) then,
  ) = __$$InitializeStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$InitializeStatusImplCopyWithImpl<$Res>
    extends _$PaymentStatusEventCopyWithImpl<$Res, _$InitializeStatusImpl>
    implements _$$InitializeStatusImplCopyWith<$Res> {
  __$$InitializeStatusImplCopyWithImpl(
    _$InitializeStatusImpl _value,
    $Res Function(_$InitializeStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$InitializeStatusImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$InitializeStatusImpl implements InitializeStatus {
  const _$InitializeStatusImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString() {
    return 'PaymentStatusEvent.initializeStatus(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeStatusImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of PaymentStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeStatusImplCopyWith<_$InitializeStatusImpl> get copyWith =>
      __$$InitializeStatusImplCopyWithImpl<_$InitializeStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderId) initializeStatus,
  }) {
    return initializeStatus(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderId)? initializeStatus,
  }) {
    return initializeStatus?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderId)? initializeStatus,
    required TResult orElse(),
  }) {
    if (initializeStatus != null) {
      return initializeStatus(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeStatus value) initializeStatus,
  }) {
    return initializeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeStatus value)? initializeStatus,
  }) {
    return initializeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeStatus value)? initializeStatus,
    required TResult orElse(),
  }) {
    if (initializeStatus != null) {
      return initializeStatus(this);
    }
    return orElse();
  }
}

abstract class InitializeStatus implements PaymentStatusEvent {
  const factory InitializeStatus(final String orderId) = _$InitializeStatusImpl;

  @override
  String get orderId;

  /// Create a copy of PaymentStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeStatusImplCopyWith<_$InitializeStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
