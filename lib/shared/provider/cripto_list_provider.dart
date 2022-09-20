import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/asset.dart';
import '../use_cases/model/cripto_model.dart';

final criptoListProvider = Provider(
  (ref) => [
    CriptoModel(
      serialId: 0,
      image: btc,
      name: 'Bitcoin',
      abbreviation: 'BTC',
      variation: 0.50,
      amount: Decimal.parse('6557'),
      done: Decimal.parse('0.65'),
      currentPrice: Decimal.parse('6557'),
      allPrices: [
        Decimal.parse('6557'),
        Decimal.parse('2000'),
        Decimal.parse('150'),
        Decimal.parse('5440'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1555'),
        Decimal.parse('50'),
        Decimal.parse('6557'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1770'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1555'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('9055'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1077'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1533'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('504'),
        Decimal.parse('1400'),
        Decimal.parse('2600'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2600'),
        Decimal.parse('9460'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1400'),
        Decimal.parse('200'),
        Decimal.parse('690'),
        Decimal.parse('150'),
        Decimal.parse('560'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1560'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('2400'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1500'),
        Decimal.parse('200'),
        Decimal.parse('950'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('2050'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2500'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('5770'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('9770'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('150'),
      ],
    ),
    CriptoModel(
      serialId: 1,
      image: eth,
      name: 'Ethereum',
      abbreviation: 'ETH',
      variation: 1.41,
      amount: Decimal.parse('7996'),
      done: Decimal.parse('0.94'),
      currentPrice: Decimal.parse('7996'),
      allPrices: [
        Decimal.parse('7996'),
        Decimal.parse('2000'),
        Decimal.parse('150'),
        Decimal.parse('5440'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1555'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1770'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1555'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('9055'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1077'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1533'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('504'),
        Decimal.parse('1400'),
        Decimal.parse('2600'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2600'),
        Decimal.parse('9460'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1400'),
        Decimal.parse('200'),
        Decimal.parse('690'),
        Decimal.parse('150'),
        Decimal.parse('560'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1560'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('2400'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1500'),
        Decimal.parse('200'),
        Decimal.parse('950'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('2050'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2500'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('5770'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('9770'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('7997'),
      ],
    ),
    CriptoModel(
      serialId: 03,
      image: ltc,
      name: 'Litecoin',
      abbreviation: 'LTC',
      variation: 1.77,
      amount: Decimal.parse('245'),
      done: Decimal.parse('0.82'),
      currentPrice: Decimal.parse('245'),
      allPrices: [
        Decimal.parse('245'),
        Decimal.parse('2000'),
        Decimal.parse('150'),
        Decimal.parse('5440'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1555'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1770'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1555'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('9055'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1077'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1533'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('504'),
        Decimal.parse('1400'),
        Decimal.parse('2600'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2600'),
        Decimal.parse('9460'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1400'),
        Decimal.parse('200'),
        Decimal.parse('690'),
        Decimal.parse('150'),
        Decimal.parse('560'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1560'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('2400'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1500'),
        Decimal.parse('200'),
        Decimal.parse('950'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('2050'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2500'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('5770'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('9770'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('245'),
      ],
    ),
  ],
);
