// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotificationState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<NotificationEntity>? get listNoti => throw _privateConstructorUsedError;
  int? get unreadQuantity => throw _privateConstructorUsedError;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
    NotificationState value,
    $Res Function(NotificationState) then,
  ) = _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call({
    bool isLoading,
    List<NotificationEntity>? listNoti,
    int? unreadQuantity,
  });
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listNoti = freezed,
    Object? unreadQuantity = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            listNoti:
                freezed == listNoti
                    ? _value.listNoti
                    : listNoti // ignore: cast_nullable_to_non_nullable
                        as List<NotificationEntity>?,
            unreadQuantity:
                freezed == unreadQuantity
                    ? _value.unreadQuantity
                    : unreadQuantity // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$NotificationStateImplCopyWith(
    _$NotificationStateImpl value,
    $Res Function(_$NotificationStateImpl) then,
  ) = __$$NotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<NotificationEntity>? listNoti,
    int? unreadQuantity,
  });
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateImpl>
    implements _$$NotificationStateImplCopyWith<$Res> {
  __$$NotificationStateImplCopyWithImpl(
    _$NotificationStateImpl _value,
    $Res Function(_$NotificationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? listNoti = freezed,
    Object? unreadQuantity = freezed,
  }) {
    return _then(
      _$NotificationStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        listNoti:
            freezed == listNoti
                ? _value._listNoti
                : listNoti // ignore: cast_nullable_to_non_nullable
                    as List<NotificationEntity>?,
        unreadQuantity:
            freezed == unreadQuantity
                ? _value.unreadQuantity
                : unreadQuantity // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc

class _$NotificationStateImpl
    with DiagnosticableTreeMixin
    implements _NotificationState {
  const _$NotificationStateImpl({
    required this.isLoading,
    final List<NotificationEntity>? listNoti,
    this.unreadQuantity,
  }) : _listNoti = listNoti;

  @override
  final bool isLoading;
  final List<NotificationEntity>? _listNoti;
  @override
  List<NotificationEntity>? get listNoti {
    final value = _listNoti;
    if (value == null) return null;
    if (_listNoti is EqualUnmodifiableListView) return _listNoti;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? unreadQuantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState(isLoading: $isLoading, listNoti: $listNoti, unreadQuantity: $unreadQuantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('listNoti', listNoti))
      ..add(DiagnosticsProperty('unreadQuantity', unreadQuantity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._listNoti, _listNoti) &&
            (identical(other.unreadQuantity, unreadQuantity) ||
                other.unreadQuantity == unreadQuantity));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_listNoti),
    unreadQuantity,
  );

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      __$$NotificationStateImplCopyWithImpl<_$NotificationStateImpl>(
        this,
        _$identity,
      );
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState({
    required final bool isLoading,
    final List<NotificationEntity>? listNoti,
    final int? unreadQuantity,
  }) = _$NotificationStateImpl;

  @override
  bool get isLoading;
  @override
  List<NotificationEntity>? get listNoti;
  @override
  int? get unreadQuantity;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
