// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemEntityImpl _$$OrderItemEntityImplFromJson(
  Map<String, dynamic> json,
) => _$OrderItemEntityImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  imgUrl: json['imgUrl'] as String,
);

Map<String, dynamic> _$$OrderItemEntityImplToJson(
  _$OrderItemEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'quantity': instance.quantity,
  'price': instance.price,
  'imgUrl': instance.imgUrl,
};
