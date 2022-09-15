import 'package:decimal/decimal.dart';

class CriptoModel {
  final String name;
  final String abbreviation;
  final Decimal value;
  final Decimal done;
  final String image;

  CriptoModel({
    required this.name,
    required this.abbreviation,
    required this.value,
    required this.done,
    required this.image,
});
}