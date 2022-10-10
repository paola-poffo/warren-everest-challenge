import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../../portfolio/providers/cripto_provider.dart';

final singleCriptoProvider = StateProvider<CriptoViewData>(
  (ref) => CriptoViewData(
    id: 'id',
    symbol: 'symbol',
    name: 'name',
    image: 'image',
    currentPrice: 0,
    percentage24h: 0,
  ),
);

final convertedCriptoProvider = StateProvider<CriptoViewData>(
  (ref) {
    return ref.read(criptosProvider).value!.first;
  },
);

