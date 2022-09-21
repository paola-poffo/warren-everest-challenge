import 'dart:convert';

class CriptoModelApi {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double priceChange;

  CriptoModelApi({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChange,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': currentPrice});
    result.addAll({'price_change_percentage_24h': priceChange});

    return result;
  }

  factory CriptoModelApi.fromMap(Map<String, dynamic> map) {
    return CriptoModelApi(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['current_price']?.toDouble() ?? 0.0,
      priceChange: map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CriptoModelApi.fromJson(String source) =>
      CriptoModelApi.fromMap(json.decode(source));
}