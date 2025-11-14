// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationEntityImpl _$$NotificationEntityImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationEntityImpl(
  title: json['title'] as String,
  body: json['body'] as String,
  isRead: json['isRead'] as bool,
  updatedAt: const FirebaseTimestampConverter().fromJson(
    json['updatedAt'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$NotificationEntityImplToJson(
  _$NotificationEntityImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'body': instance.body,
  'isRead': instance.isRead,
  'updatedAt': const FirebaseTimestampConverter().toJson(instance.updatedAt),
};
