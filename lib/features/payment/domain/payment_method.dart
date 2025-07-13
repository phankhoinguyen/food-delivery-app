abstract class PaymentMethod {
  final PaymentType type;
  final String title;
  final String imgUrl;

  const PaymentMethod(this.type, {required this.title, required this.imgUrl});
}

enum PaymentType { momo, vnpay, cod }
