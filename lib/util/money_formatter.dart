import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class MoneyFormatter {
  static String rupiahFormatter(String money) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: 123123);
    MoneyFormatterOutput fo = fmf.output;

    return fmf
        .copyWith(symbol: 'Rp.', amount: double.parse(money), fractionDigits: 3)
        .output
        .symbolOnLeft;
  }
}
