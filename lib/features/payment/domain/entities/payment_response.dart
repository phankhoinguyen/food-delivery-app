import 'package:equatable/equatable.dart';

class PaymentResponse extends Equatable {
  final bool success;
  final String message;
  final PaymentData? data;

  const PaymentResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data:
          json['data'] != null
              ? PaymentData.fromJson(json['data'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data?.toJson()};
  }

  @override
  List<Object?> get props => [success, message, data];
}

class PaymentData extends Equatable {
  final String? paymentId;
  final String? provider;
  final String? status;
  final String? requestId;
  final String? transactionId;
  final String? deepLink;
  final String? qrCodeUrl;
  final String? smartUrl;

  const PaymentData({
    this.paymentId,
    this.provider,
    this.status,
    this.requestId,
    this.transactionId,
    this.deepLink,
    this.qrCodeUrl,
    this.smartUrl,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      paymentId: json['paymentId'] as String?,
      provider: json['provider'] as String?,
      status: json['status'] as String?,
      requestId: json['requestId'] as String?,
      transactionId: json['transactionId'] as String?,
      deepLink: json['deepLink'] as String?,
      qrCodeUrl: json['qrCodeUrl'] as String?,
      smartUrl: json['smartUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'provider': provider,
      'status': status,
      'requestId': requestId,
      'transactionId': transactionId,
      'deepLink': deepLink,
      'qrCodeUrl': qrCodeUrl,
      'smartUrl': smartUrl,
    };
  }

  @override
  List<Object?> get props => [
    paymentId,
    provider,
    status,
    requestId,
    transactionId,
    deepLink,
    qrCodeUrl,
    smartUrl,
  ];
}
