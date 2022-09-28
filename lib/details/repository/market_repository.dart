import '../../shared/api/models/endpoints/criptos_endpoint.dart';
import '../../shared/api/models/market_response.dart';

class MarketRepository {
  final CriptosEndpoint endpoint;
  MarketRepository(this.endpoint);

  Future<MarketResponse> getAllMarketCriptos(String id) async {
    final response = await endpoint.getMarketCripto(id);
    return MarketResponse.fromJson(response.data);
  }
}
