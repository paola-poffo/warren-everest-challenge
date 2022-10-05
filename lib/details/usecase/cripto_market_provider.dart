import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/criptos_market_view_data.dart';
import '../repository/market_repository_provider.dart';
import 'cripto_market_usecase.dart';

final marketUsecaseProvider = Provider((ref) {
    return CriptosMarketUsecase(ref.watch(marketRepositoryProvider));
  },
);

final marketProvider =
    FutureProvider.family<CriptosMarketViewData, String>(((ref, id) {
    return ref.read(marketUsecaseProvider).execute(id);
  }),
);
