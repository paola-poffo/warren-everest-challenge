import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/criptos_usecase_provider.dart';
import 'cripto_balance.dart';
import 'cripto_list.dart';

class BodyCriptos extends HookConsumerWidget {
  const BodyCriptos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final criptos = ref.watch(criptosProvider);

    return criptos.when(
      data: (data) {
        return Column(
          children: [
            const CriptoBalance(),
            CriptoList(
              criptosViewData: data,
            ),
          ],
        );
      },
      error: (object, stackTracer) {
        return const Center(
          child: Text('Tente novamente em instantes'),
        );
      },
      loading: () {
        return const Center(
          child:
              CircularProgressIndicator(color: Color.fromRGBO(224, 43, 87, 1)),
        );
      },
    );
  }
}
