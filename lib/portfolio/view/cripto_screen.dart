import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/all_balance.dart';
import '../widgets/cripto_list.dart';
import '../../shared/provider/cripto_provider.dart';

class CriptoScreen extends StatefulHookConsumerWidget {
  const CriptoScreen({Key? key}) : super(key: key);

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
      ),
    );
  }
}
