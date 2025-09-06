import 'package:intl/intl.dart';

extension CurrencyFormat on num {
  String toVND() {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return formatter.format(this);
  }
}
