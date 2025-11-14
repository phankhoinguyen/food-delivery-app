import 'package:intl/intl.dart';

extension CurrencyFormat on num {
  String toVND() {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return formatter.format(this);
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  // Hoặc in hoa chữ cái đầu mỗi từ
}
