import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/currency_formatter.dart';
import '../../shared/provider/cripto_provider.dart';

class CoinBallance extends HookConsumerWidget {
  const CoinBallance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var onlyoneCripto = ref.watch(criptoProvider.notifier).state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              onlyoneCripto.name,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(onlyoneCripto.image),
            ),
          ],
        ),
        Text(
          onlyoneCripto.abbreviation,
          style: const TextStyle(
            color: Color.fromRGBO(117, 118, 128, 1),
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          FormatCurrency.format(onlyoneCripto.allPrices.first),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
