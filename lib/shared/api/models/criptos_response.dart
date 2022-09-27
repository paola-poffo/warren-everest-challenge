import 'package:json_annotation/json_annotation.dart';

part 'criptos_response.g.dart';

@JsonSerializable()
class CriptosResponse {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double percentage24h;
  CriptosResponse(
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.percentage24h,
  );

  factory CriptosResponse.fromJson(Map<String, dynamic> json) =>
      _$CriptosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CriptosResponseToJson(this);
}
