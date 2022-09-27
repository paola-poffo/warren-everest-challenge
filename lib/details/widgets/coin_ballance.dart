// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../../shared/utils/currency_formatter.dart';

class CoinBallance extends HookConsumerWidget {
  final CriptosViewData criptosViewData;
  const CoinBallance({
    Key? key,
    required this.criptosViewData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              criptosViewData.name,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25,
              backgroundImage: NetworkImage(criptosViewData.image),
            ),
          ],
        ),
        Text(
          criptosViewData.symbol.toUpperCase(),
          style: const TextStyle(
            color: Color.fromRGBO(117, 118, 128, 1),
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          FormatCurrency.format(criptosViewData.currentPrice),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
