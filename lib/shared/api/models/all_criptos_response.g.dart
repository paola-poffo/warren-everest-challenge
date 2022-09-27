// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_criptos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCriptosResponse _$AllCriptosResponseFromJson(
        Map<String, dynamic> json) =>
    AllCriptosResponse(
      (json['results'] as List<dynamic>)
          .map((e) => CriptosResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCriptosResponseToJson(
        AllCriptosResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
