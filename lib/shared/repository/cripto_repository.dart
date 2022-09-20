import 'package:dio/dio.dart';
import '../use_cases/model/cripto_models.dart';

class CriptoRepository {
  final Dio dio;
  CriptoRepository(this.dio);

  Future<List<CriptoModels>> getAllCoins() async {
    List<CriptoModels> criptos = [];

    final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=BRL&order=market_cap_desc&per_page=10&page=1&sparkline=false');

    criptos = List.from(
      response.data.map((cripto) {
        return CriptoModels.fromMap(cripto);
      }),
    );

    return criptos;
  }
}
