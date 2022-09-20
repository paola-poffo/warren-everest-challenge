import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/widgets/bottom_navigation.dart';
import '../widgets/all_balance.dart';
import '../widgets/cripto_list.dart';

class CriptoScreen extends StatefulHookConsumerWidget {
  const CriptoScreen({Key? key}) : super(key: key);

  static const route = '/cripto';

  @override
  ConsumerState<CriptoScreen> createState() => _CriptoScreenState();
}

class _CriptoScreenState extends ConsumerState<CriptoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: const [
              AllBalance(),
              CriptoList(),
            ],
          ),
          bottomNavigationBar: const BottomNavigation(index: 0)),
    );
  }
}
