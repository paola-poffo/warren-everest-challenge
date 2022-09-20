// To parse this JSON data, do
//
//     final get = getFromJson(jsonString);

import 'dart:convert';

List<Get> getFromJson(String str) => List<Get>.from(json.decode(str).map((x) => Get.fromJson(x)));

String getToJson(List<Get> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Get {
    Get({
        required this.id,
        required this.symbol,
        required this.name,
    });

    String id;
    String symbol;
    String name;

    factory Get.fromJson(Map<String, dynamic> json) => Get(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
    };
}
