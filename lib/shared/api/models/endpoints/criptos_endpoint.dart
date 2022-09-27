import 'package:dio/dio.dart';

class CriptosEndpoint {
  final Dio _dio;
  CriptosEndpoint(this._dio);

  Future<Response> getCriptos() async {
    return await _dio.get(
        '/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }

  Future<Response> getMarketCripto(String cripto) async {
    return await _dio.get(
        '/coins/$cripto/market_chart?vs_currency=brl&days=365&interval=daily');
  }
}
