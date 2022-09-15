import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionsScreen extends StatefulHookConsumerWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movimentações'),
        ),
        body: const Text(''),
      ),
    );
  }
}
