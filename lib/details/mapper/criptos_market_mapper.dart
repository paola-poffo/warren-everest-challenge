import '../../shared/api/models/market_response.dart';
import '../model/criptos_market_view_data.dart';

extension CriptosMarketMapper on MarketResponse {
  CriptosMarketViewData toViewData() {
    return CriptosMarketViewData(
      List.from(
        prices.map(
          (prices) {
            return prices;
          },
        ),
      ),
    );
  }
}