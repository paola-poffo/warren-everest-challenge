import 'package:flutter/material.dart';

import 'transactions_list.dart';

class TransactionsBody extends StatelessWidget {
  const TransactionsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Movimentações',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(thickness: 1, height: 0.2),
        Expanded(
          child: TransactionsList(),
        ),
      ],
    );
  }
}
