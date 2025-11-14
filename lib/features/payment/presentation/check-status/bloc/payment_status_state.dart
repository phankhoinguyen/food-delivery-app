import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_status_state.freezed.dart';

@freezed
abstract class PaymentStatusState with _$PaymentStatusState {
  factory PaymentStatusState({@Default(true) bool isLoading, bool? success}) =
      _PaymentStatusState;
}
