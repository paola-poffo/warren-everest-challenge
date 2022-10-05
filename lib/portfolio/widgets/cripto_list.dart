import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/criptos_view_data.dart';
import '../providers/amount_provider.dart';
import '../providers/cripto_provider.dart';
import '../providers/cripto_conversion_provider.dart';
import 'cripto_type.dart';

class CriptoList extends HookConsumerWidget {
  const CriptoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final criptoProvider = ref.watch(criptosProvider);

    return criptoProvider.when(
      data: (criptoData) {
        Future.delayed(Duration.zero, () {
          double getBalance() {
            double amount = 0;
            for (CriptoViewData cripto in criptoData) {
              amount += cripto.currentPrice;
            }
            return amount;
          }

          ref.read(amountProvider.state).state = getBalance();
        });
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: criptoData.length,
            itemBuilder: (context, index) {
              CriptoViewData criptoViewData = criptoData[index];
              return CriptoType(
                criptoViewData: criptoViewData,
                criptoConversion: ref.watch(criptoConversionProvider)[index],
              );
            },
          ),
        );
      },
      error: (object, stackTracer) {
        return const Center(
          child: Text('Tente novamente em instantes'),
        );
      },
      loading: () {
        return const Center(
          child:
              CircularProgressIndicator(color: Color.fromRGBO(224, 43, 87, 1)),
        );
      },
    );
  }
}
