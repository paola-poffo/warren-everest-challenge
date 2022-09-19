import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../use_cases/model/cripto_model.dart';

class DetailsCryptoNotifier extends StateNotifier<CriptoModel> {
  DetailsCryptoNotifier()
      : super(
          CriptoModel(
            serialId: 0,
            image: '1',
            name: '',
            abbreviation: '',
            variation: 1.3,
            amount: Decimal.parse('1'),
            done: Decimal.parse('1'),
            currentPrice: Decimal.parse('1'),
            singlePrice: [Decimal.parse('1')],
            allPrices: [Decimal.parse('1')],
          ),
        );

  void changeDetailsCripto(CriptoModel model) {
    state = model;
  }
}
