import 'package:warren_everest_challenge/details/mapper/criptos_market_mapper.dart';

import '../model/criptos_market_view_data.dart';
import '../repository/market_repository.dart';

class CriptosMarketUsecase {
  final MarketRepository repository;
  CriptosMarketUsecase(this.repository);

  Future<CriptosMarketViewData> execute(String id) async {
    final response = await repository.getAllMarketCriptos(id);
    return response.toViewData();
  }
}