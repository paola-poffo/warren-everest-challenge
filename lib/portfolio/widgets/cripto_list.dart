import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/shared/use_cases/model/cripto_model_api.dart';
import '../../shared/provider/cripto_list_provider.dart';
import '../../shared/repository/cripto_repository.dart';
import 'cripto_type.dart';

import '../../shared/use_cases/model/cripto_model.dart';

class CriptoList extends StatefulHookConsumerWidget {
  const CriptoList({Key? key}) : super(key: key);

  @override
  ConsumerState<CriptoList> createState() => _CriptoListState();
}

class _CriptoListState extends ConsumerState<CriptoList> {
  CriptoRepository repository = CriptoRepository(Dio());
  late Future<List<CriptoModelApi>> criptos;

  @override
  void initState() {
    criptos = repository.getAllCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
