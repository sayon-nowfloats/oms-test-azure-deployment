import 'package:intl/intl.dart';

class CurrencyHelper {}

final indianRupeesFormat = NumberFormat.currency(
  name: "INR",
  locale: 'en_IN',
  decimalDigits: 0, // change it to get decimal places
  symbol: '₹ ',
);

extension RupeesFormatter on int {
  String inRupeesFormat() {
    return "${indianRupeesFormat.format(this)}/-";
  }
}
