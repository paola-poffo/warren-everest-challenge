// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criptos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriptosResponse _$CriptosResponseFromJson(Map<String, dynamic> json) =>
    CriptosResponse(
      json['id'] as String,
      json['symbol'] as String,
      json['name'] as String,
      json['image'] as String,
      (json['current_price'] as num).toDouble(),
      (json['price_change_percentage_24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CriptosResponseToJson(CriptosResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.percentage24h,
    };
