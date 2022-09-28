import '../../shared/api/models/all_criptos_response.dart';
import '../model/criptos_view_data.dart';

extension CriptosMapper on AllCriptosResponse {
  List<CriptosViewData> toViewData() {
    return results
        .map(
          (result) => CriptosViewData(
            id: result.id,
            symbol: result.symbol,
            name: result.name,
            image: result.image,
            currentPrice: result.currentPrice,
            percentage24h: result.percentage24h,
          ),
        )
        .toList();
  }
}
