import 'package:json_annotation/json_annotation.dart';

import 'criptos_response.dart';

part 'all_criptos_response.g.dart';

@JsonSerializable()
class AllCriptosResponse {
  List<CriptosResponse> results;

  AllCriptosResponse(this.results);

  factory AllCriptosResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCriptosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllCriptosResponseToJson(this);
}
