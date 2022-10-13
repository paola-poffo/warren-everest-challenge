import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../conversion/provider/single_cripto_provider.dart';

class TransactionsInfo extends ConsumerWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final String total;
  final DateTime date;

  const TransactionsInfo({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.total,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertedCripto = ref.watch(convertedCriptoProvider.state);

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            convertQuantity,
            style: TextStyle(color: Colors.grey.shade700),
          ),
          Text(
            '$receiveQuantity ${convertedCripto.state.symbol.toUpperCase()}',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('dd/MM/yyyy').format(date),
            style: TextStyle(color: Colors.grey.shade700),
          ),
          Text(
            total,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
