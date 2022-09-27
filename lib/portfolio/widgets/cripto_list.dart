import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/criptos_view_data.dart';
import '../providers/amount_provider.dart';
import 'cripto_type.dart';

class CriptoList extends HookConsumerWidget {
  const CriptoList({Key? key, required this.criptosViewData}) : super(key: key);

  final List<CriptosViewData> criptosViewData;

  double getBalance(List<CriptosViewData> criptos) {
    double amount = 0;
    for (CriptosViewData cripto in criptos) {
      amount += cripto.currentPrice;
    }
    return amount;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(amountProvider.state).state = getBalance(criptosViewData);
      },
    );
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: criptosViewData.length,
        itemBuilder: (context, index) {
          CriptosViewData cripto = criptosViewData[index];
          return CriptoType(criptosViewData: cripto);
        },
      ),
    );
  }
}
