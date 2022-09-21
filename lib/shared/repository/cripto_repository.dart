import 'package:dio/dio.dart';
import '../use_cases/model/cripto_model_api.dart';

class CriptoRepository {
  final Dio dio;
  CriptoRepository(this.dio);

  Future<List<CriptoModelApi>> getAllCoins() async {
    List<CriptoModelApi> criptos = [];

    final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');

    criptos = List.from(
      response.data.map((cripto) {
        return CriptoModelApi.fromMap(cripto);
      }),
    );

    return criptos;
  }
}
