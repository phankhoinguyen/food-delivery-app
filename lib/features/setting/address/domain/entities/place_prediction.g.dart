// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlacePredictionImpl _$$PlacePredictionImplFromJson(
  Map<String, dynamic> json,
) => _$PlacePredictionImpl(
  placeId: json['placeId'] as String,
  displayName: json['displayName'] as String,
  formattedAddress: json['formattedAddress'] as String,
  uid: json['uid'] as String,
  isDefault: json['isDefault'] as bool? ?? false,
  type: json['type'] as String?,
  lat: json['lat'] as String?,
  description: json['description'] as String?,
  long: json['long'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$PlacePredictionImplToJson(
  _$PlacePredictionImpl instance,
) => <String, dynamic>{
  'placeId': instance.placeId,
  'displayName': instance.displayName,
  'formattedAddress': instance.formattedAddress,
  'uid': instance.uid,
  'isDefault': instance.isDefault,
  'type': instance.type,
  'lat': instance.lat,
  'description': instance.description,
  'long': instance.long,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
