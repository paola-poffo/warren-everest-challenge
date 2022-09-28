// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketResponse _$MarketResponseFromJson(Map<String, dynamic> json) =>
    MarketResponse(
      (json['prices'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$MarketResponseToJson(MarketResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
    };
