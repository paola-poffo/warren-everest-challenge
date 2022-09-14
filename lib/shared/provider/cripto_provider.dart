import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/asset.dart';
import '../use_cases/model/cripto_model.dart';

final criptoProvider = Provider(
  (ref) => [
    CriptoModel(
      name: 'Bitcoin',
      abbreviation: 'BTC',
      value: Decimal.parse('6557.00') ,
      done: Decimal.parse('0.65') ,
      image: btc,
    ),
    CriptoModel(
      name: 'Ethereum',
      abbreviation: 'ETH',
      value: Decimal.parse('7996.00') ,
      done: Decimal.parse('0.94') ,
      image: eth,
    ),
    CriptoModel(
      name: 'Litecoin',
      abbreviation: 'LTC',
      value: Decimal.parse('245.00') ,
      done: Decimal.parse('0.82') ,
      image: ltc,
    ),
  ],
);
