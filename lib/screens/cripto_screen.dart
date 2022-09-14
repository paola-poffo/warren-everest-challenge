import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/screens/widgets/all_balance.dart';
import 'package:warren_everest_challenge/screens/widgets/cripto_list.dart';
import 'package:warren_everest_challenge/shared/template/cripto_provider.dart';
import '../shared/widgets/bottom_navigation.dart';

class CriptoScreen extends StatefulHookConsumerWidget {
  const CriptoScreen({Key? key}) : super(key: key);

  static String route = 'screen';

  @override
  ConsumerState<CriptoScreen> createState() => _CriptoScreenState();
}

class _CriptoScreenState extends ConsumerState<CriptoScreen> {
  @override
  Widget build(BuildContext context) {
    final criptos = ref.watch(criptoProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AllBalance(),
            CriptoList(criptos: criptos),
          ],
        ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}
