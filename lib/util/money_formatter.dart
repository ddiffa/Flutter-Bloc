import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class MoneyFormatter {
  static String rupiahFormatter(double money) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: money);
    String output = fmf
        .copyWith(
            symbol: 'Rp.',
            amount: money,
            fractionDigits: 3,
            decimalSeparator: ',',
            thousandSeparator: '.')
        .output
        .symbolOnLeft;
    return output.replaceAll(",000", "");
  }
}
