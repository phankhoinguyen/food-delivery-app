// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderEntityImpl _$$OrderEntityImplFromJson(Map<String, dynamic> json) =>
    _$OrderEntityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      orderId: json['orderId'] as String,
      amount: (json['amount'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      preparationStatus: json['preparationStatus'] as String,
      userToken: json['userToken'] as String?,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => OrderItemEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
      createdAt: FirestoreTimestamp.fromJson(
        json['createdAt'] as Map<String, dynamic>,
      ),
      paymentStatus: json['paymentStatus'] as String,
      updatedAt: FirestoreTimestamp.fromJson(
        json['updatedAt'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$OrderEntityImplToJson(_$OrderEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'orderId': instance.orderId,
      'amount': instance.amount,
      'paymentMethod': instance.paymentMethod,
      'preparationStatus': instance.preparationStatus,
      'userToken': instance.userToken,
      'items': instance.items,
      'createdAt': instance.createdAt,
      'paymentStatus': instance.paymentStatus,
      'updatedAt': instance.updatedAt,
    };

_$FirestoreTimestampImpl _$$FirestoreTimestampImplFromJson(
  Map<String, dynamic> json,
) => _$FirestoreTimestampImpl(
  seconds: (json['_seconds'] as num).toInt(),
  nanoseconds: (json['_nanoseconds'] as num).toInt(),
);

Map<String, dynamic> _$$FirestoreTimestampImplToJson(
  _$FirestoreTimestampImpl instance,
) => <String, dynamic>{
  '_seconds': instance.seconds,
  '_nanoseconds': instance.nanoseconds,
};
