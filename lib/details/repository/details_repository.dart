import 'package:dio/dio.dart';

class DetailsRepository {
  final Dio dio;

  DetailsRepository(this.dio);

  Future<List<double>> getDaysData(String id, int days) async {
    List<double> details = [];
    final response = await dio.get(
        "https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$days");

    details = List.from(response.data.map((detail) {
      return detail[4];
    }));

    return details;
  }
}