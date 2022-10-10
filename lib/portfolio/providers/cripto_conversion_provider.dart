import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final criptoConversionProvider =
    StateNotifierProvider<CriptoConversionNotifier, List<double>>(
  (ref) => CriptoConversionNotifier(),
);

class CriptoConversionNotifier extends StateNotifier<List<double>> {
  CriptoConversionNotifier() : super([]) {
    for (double lenght = 0; lenght < 100; lenght++) {
      state.add(Random().nextDouble() * 2);
    }
  }
}
