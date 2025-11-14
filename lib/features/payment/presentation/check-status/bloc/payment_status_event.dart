import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_status_event.freezed.dart';

@freezed
abstract class PaymentStatusEvent with _$PaymentStatusEvent {
  const factory PaymentStatusEvent.initializeStatus(String orderId) =
      InitializeStatus;
}
