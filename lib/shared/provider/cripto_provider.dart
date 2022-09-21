import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../use_cases/model/cripto_model_api.dart';

var criptoProviderApi = StateNotifierProvider<CriptoNotifier, CriptoModelApi>(
  (ref) => CriptoNotifier(),
);

class CriptoNotifier extends StateNotifier<CriptoModelApi> {
  CriptoNotifier()
      : super(
          CriptoModelApi(
            id: '',
            name: '',
            currentPrice: 0,
            image: '',
            symbol: '',
            priceChange: 0,
          ),
        );
}