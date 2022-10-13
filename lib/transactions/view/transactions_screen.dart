import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/widgets/bottom_navigation.dart';
import '../widgets/transactions_body.dart';

class TransactionsScreen extends StatefulHookConsumerWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static const route = '/transactions';

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: TransactionsBody(),
        bottomNavigationBar: BottomNavigation(index: 1),
      ),
    );
  }
}
