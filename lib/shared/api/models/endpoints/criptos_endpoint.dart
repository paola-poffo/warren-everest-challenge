import 'package:dio/dio.dart';

class CriptosEndpoint {
  final Dio _dio;
  CriptosEndpoint(this._dio);

  Future<Response> getCriptos() async {
    return await _dio.get(
      '/coins/markets',
      queryParameters: {
        "vs_currency": "brl",
      },
    );
  }

  Future<Response> getMarketCripto(String cripto) async {
    return await _dio.get(
        '/coins/$cripto/market_chart?vs_currency=brl&days=365&interval=daily');
  }
}
