import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../use_cases/model/cripto_model.dart';
import '../utils/currency_formatter.dart';

var criptoProvider = StateNotifierProvider<CriptoNotifier, CriptoModel>(
  (ref) => CriptoNotifier(),
);

class CriptoNotifier extends StateNotifier<CriptoModel> {
  CriptoNotifier()
      : super(
          CriptoModel(
            serialId: 0,
            image: '',
            name: '',
            abbreviation: '',
            variation: 0,
            amount: Decimal.parse('1'),
            done: Decimal.parse('1'),
            currentPrice: Decimal.parse('1'),
            allPrices: [Decimal.parse('0')],
          ),
        );
  void getchangeVariation(int time) {
    time = time == 1 ? 2 : time;
    state
        .variation = (DecimalFormatter.decimalFormatter(state.allPrices.first) /
                DecimalFormatter.decimalFormatter(state.allPrices[time - 1]) -
            1) *
        100;
  }
}

var currentPriceProvider = StateNotifierProvider<CurrentPriceNotifier, Decimal>(
  (ref) => CurrentPriceNotifier(),
);

class CurrentPriceNotifier extends StateNotifier<Decimal> {
  CurrentPriceNotifier() : super(Decimal.parse('0'));

  void getCurrentPrice(int days, CriptoModel cripto) {
    state = (cripto.allPrices[days - 1]);
  }
}
