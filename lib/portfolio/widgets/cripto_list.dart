import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/provider/cripto_list_provider.dart';
import 'cripto_type.dart';

import '../../shared/use_cases/model/cripto_model.dart';

class CriptoList extends HookConsumerWidget {
  const CriptoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var criptos = ref.watch(criptoListProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: criptos.length,
        itemBuilder: (context, index) {
          CriptoModel cripto = criptos[index];
          return CriptoType(
            criptoModel: cripto,
          );
        },
      ),
    );
  }
}
