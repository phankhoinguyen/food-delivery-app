import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_prediction.freezed.dart';
part 'place_prediction.g.dart';

@freezed
class PlacePrediction with _$PlacePrediction {
  const factory PlacePrediction({
    required String placeId,
    required String displayName,
    required String formattedAddress,
    required String uid,
    @Default(false) bool? isDefault,
    String? type,
    String? lat,
    String? description,
    String? long,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PlacePrediction;

  factory PlacePrediction.fromJson(Map<String, dynamic> json) =>
      _$PlacePredictionFromJson(json);
}
