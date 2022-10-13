import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/transactions_provider.dart';
import 'transactions_info.dart';

class TransactionsList extends HookConsumerWidget {
  const TransactionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var transactions = ref.watch(transactionsProvider.state).state;

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(thickness: 1, height: 0.2),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return TransactionsInfo(
          convertQuantity: transactions[index].converted,
          receiveQuantity: transactions[index].received,
          total: transactions[index].value,
          date: DateTime.now(),
        );
      },
    );
  }
}
