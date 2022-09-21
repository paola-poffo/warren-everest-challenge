import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/use_cases/model/cripto_model_api.dart';

var ballanceProviderApi =
    StateNotifierProvider<BallanceNotifier, double>((ref) => BallanceNotifier());

class BallanceNotifier extends StateNotifier<double> {
  BallanceNotifier() : super(0.0);

  void ballance(List<CriptoModelApi> criptos) {
    for (CriptoModelApi cripto in criptos) {
      state += cripto.currentPrice * 0.5;
    }
  }
}