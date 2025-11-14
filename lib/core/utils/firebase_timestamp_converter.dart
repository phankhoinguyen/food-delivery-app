import 'package:freezed_annotation/freezed_annotation.dart';

class FirebaseTimestampConverter
    implements JsonConverter<DateTime, Map<String, dynamic>> {
  const FirebaseTimestampConverter();

  @override
  DateTime fromJson(Map<String, dynamic> json) {
    final seconds = json['_seconds'] as int;
    final nanoseconds = json['_nanoseconds'] as int;
    return DateTime.fromMillisecondsSinceEpoch(
      seconds * 1000 + (nanoseconds / 1000000).round(),
    );
  }

  @override
  Map<String, dynamic> toJson(DateTime dateTime) {
    final milliseconds = dateTime.millisecondsSinceEpoch;
    return {
      '_seconds': milliseconds ~/ 1000,
      '_nanoseconds': (milliseconds % 1000) * 1000000,
    };
  }
}
