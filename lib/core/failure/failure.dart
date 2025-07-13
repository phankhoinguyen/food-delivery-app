import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unexpected() = _Unexpected;
  const factory Failure.serverError() = _ServerError;
  const factory Failure.unableToUpdate() = _UnableToUpdate;

  const factory Failure.message(String message) = _Message;
}
