import 'package:json_annotation/json_annotation.dart';

part 'market_response.g.dart';

@JsonSerializable()
class MarketResponse {
  List<List<num>> prices;

  MarketResponse(this.prices);

  factory MarketResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketResponseToJson(this);
}
