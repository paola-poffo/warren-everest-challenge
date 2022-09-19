// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:decimal/decimal.dart';

class CriptoModel {
  int serialId;
  String image;
  String name;
  String abbreviation;
  double variation;
  Decimal amount;
  Decimal done;
  Decimal currentPrice;
  List<Decimal> singlePrice;
  List<Decimal> allPrices;

  CriptoModel({
    required this.serialId,
    required this.image,
    required this.name,
    required this.abbreviation,
    required this.variation,
    required this.amount,
    required this.done,
    required this.currentPrice,
    required this.singlePrice,
    required this.allPrices,
  });
}
