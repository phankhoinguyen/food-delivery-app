// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrderList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrderList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrderList,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrderList value) getOrderList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrderList value)? getOrderList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrderList value)? getOrderList,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
    OrderEvent value,
    $Res Function(OrderEvent) then,
  ) = _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetOrderListImplCopyWith<$Res> {
  factory _$$GetOrderListImplCopyWith(
    _$GetOrderListImpl value,
    $Res Function(_$GetOrderListImpl) then,
  ) = __$$GetOrderListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOrderListImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$GetOrderListImpl>
    implements _$$GetOrderListImplCopyWith<$Res> {
  __$$GetOrderListImplCopyWithImpl(
    _$GetOrderListImpl _value,
    $Res Function(_$GetOrderListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetOrderListImpl implements GetOrderList {
  const _$GetOrderListImpl();

  @override
  String toString() {
    return 'OrderEvent.getOrderList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOrderListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getOrderList,
  }) {
    return getOrderList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getOrderList,
  }) {
    return getOrderList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getOrderList,
    required TResult orElse(),
  }) {
    if (getOrderList != null) {
      return getOrderList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrderList value) getOrderList,
  }) {
    return getOrderList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrderList value)? getOrderList,
  }) {
    return getOrderList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrderList value)? getOrderList,
    required TResult orElse(),
  }) {
    if (getOrderList != null) {
      return getOrderList(this);
    }
    return orElse();
  }
}

abstract class GetOrderList implements OrderEvent {
  const factory GetOrderList() = _$GetOrderListImpl;
}
