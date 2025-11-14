// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentStatusState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Create a copy of PaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentStatusStateCopyWith<PaymentStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusStateCopyWith<$Res> {
  factory $PaymentStatusStateCopyWith(
    PaymentStatusState value,
    $Res Function(PaymentStatusState) then,
  ) = _$PaymentStatusStateCopyWithImpl<$Res, PaymentStatusState>;
  @useResult
  $Res call({bool isLoading, bool? success});
}

/// @nodoc
class _$PaymentStatusStateCopyWithImpl<$Res, $Val extends PaymentStatusState>
    implements $PaymentStatusStateCopyWith<$Res> {
  _$PaymentStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoading = null, Object? success = freezed}) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            success:
                freezed == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentStatusStateImplCopyWith<$Res>
    implements $PaymentStatusStateCopyWith<$Res> {
  factory _$$PaymentStatusStateImplCopyWith(
    _$PaymentStatusStateImpl value,
    $Res Function(_$PaymentStatusStateImpl) then,
  ) = __$$PaymentStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool? success});
}

/// @nodoc
class __$$PaymentStatusStateImplCopyWithImpl<$Res>
    extends _$PaymentStatusStateCopyWithImpl<$Res, _$PaymentStatusStateImpl>
    implements _$$PaymentStatusStateImplCopyWith<$Res> {
  __$$PaymentStatusStateImplCopyWithImpl(
    _$PaymentStatusStateImpl _value,
    $Res Function(_$PaymentStatusStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isLoading = null, Object? success = freezed}) {
    return _then(
      _$PaymentStatusStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        success:
            freezed == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc

class _$PaymentStatusStateImpl implements _PaymentStatusState {
  _$PaymentStatusStateImpl({this.isLoading = true, this.success});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? success;

  @override
  String toString() {
    return 'PaymentStatusState(isLoading: $isLoading, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStatusStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, success);

  /// Create a copy of PaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStatusStateImplCopyWith<_$PaymentStatusStateImpl> get copyWith =>
      __$$PaymentStatusStateImplCopyWithImpl<_$PaymentStatusStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PaymentStatusState implements PaymentStatusState {
  factory _PaymentStatusState({final bool isLoading, final bool? success}) =
      _$PaymentStatusStateImpl;

  @override
  bool get isLoading;
  @override
  bool? get success;

  /// Create a copy of PaymentStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentStatusStateImplCopyWith<_$PaymentStatusStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
