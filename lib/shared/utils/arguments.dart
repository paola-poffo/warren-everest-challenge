import '../../portfolio/model/criptos_view_data.dart';

class Argument {
  final CriptoViewData criptoViewData;
  final double criptoConversion;
  Argument({
    required this.criptoViewData,
    required this.criptoConversion,
  });
}

class RevisionArguments {
  String convertQuantity;
  String receiveQuantity;
  CriptoViewData criptoConversion;
  CriptoViewData criptoReceive;
  String total;
  double discount;
  double increase;
  String idDiscount;
  String idIncrease;

  RevisionArguments({
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.criptoConversion,
    required this.criptoReceive,
    required this.total,
    required this.discount,
    required this.increase,
    required this.idDiscount,
    required this.idIncrease,
  });
}
