class TransactionsModel {
  String converted;
  String received;
  DateTime date;
  String value;
  double discount;
  double increase;
  String idDiscount;
  String idIncrease;
  TransactionsModel({
    required this.converted,
    required this.received,
    required this.date,
    required this.value,
    required this.discount,
    required this.increase,
    required this.idDiscount,
    required this.idIncrease,
  });
}