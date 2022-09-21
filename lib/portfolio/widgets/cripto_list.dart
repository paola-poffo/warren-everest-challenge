import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/shared/use_cases/model/cripto_model_api.dart';
import '../../shared/repository/cripto_repository.dart';
import '../providers/balance_provider_api.dart';
import 'cripto_type.dart';


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
    return Expanded(
      child: FutureBuilder(
        future: criptos,
        builder: (context, AsyncSnapshot<List<CriptoModelApi>> snapshot) {
          if (snapshot.hasData) {
            ref.read(ballanceProviderApi.notifier).ballance(snapshot.data!);
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                CriptoModelApi cripto = snapshot.data![index];
                return CriptoType(
                  criptoModelApi: cripto,
                );
              },
            );
          }
          return const Text('');
        },
      ),
    );
  }
}
