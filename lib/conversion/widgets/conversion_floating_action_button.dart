import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/arguments.dart';
import '../provider/single_cripto_provider.dart';

class ConversionFloatingActionButton extends ConsumerWidget {
  const ConversionFloatingActionButton({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text(
        'Atenção!',
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      content: const Text(
        'Moeda em Duplicidade',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final argument = ModalRoute.of(context)!.settings.arguments as Argument;

    final done = ref.watch(conversionDoneProvider.state);
    final singleCripto = ref.watch(singleCriptoProvider.state);
    final convertedCripto = ref.watch(convertedCriptoProvider.state);

    return FloatingActionButton(
      onPressed: done.state
          ? () {
              if (singleCripto.state.symbol == convertedCripto.state.symbol) {
                showAlertDialog(context);
              } else {
                Navigator.of(context).pushNamed(
                  '/revision',
                  arguments: Argument(
                    criptoViewData: argument.criptoViewData,
                    criptoConversion: argument.criptoConversion,
                  ),
                );
              }
            }
          : null,
      backgroundColor: done.state
          ? const Color.fromRGBO(224, 43, 87, 1)
          : const Color.fromRGBO(201, 202, 212, 1),
      child: const Icon(Icons.navigate_next),
    );
  }
}
