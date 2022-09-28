import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class FormatCurrency {
  static String format(double price) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR').format(price);
  }
}

class DecimalFormatter {
  static double decimalFormatter(Decimal number) {
    return double.parse(number.toString());
  }
}
