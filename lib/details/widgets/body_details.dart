import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/details/widgets/variation_detail.dart';
import '../../shared/provider/day_provider.dart';
import '../../shared/utils/currency_formatter.dart';
import '../../shared/provider/cripto_provider.dart';
import 'button_day.dart';
import 'coin_ballance.dart';
import 'currency_converter_button.dart';
import 'graphic.dart';

class BodyDetails extends HookConsumerWidget {
  const BodyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var criptoModel = ref.watch(criptoProvider.notifier).state;
    var days = ref.watch(dayProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CoinBallance(),
            const Graphic(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: const [
                  ButtonDay(
                    title: '5D',
                    daysButton: 5,
                  ),
                  ButtonDay(
                    title: '15D',
                    daysButton: 15,
                  ),
                  ButtonDay(
                    title: '30D',
                    daysButton: 30,
                  ),
                  ButtonDay(
                    title: '45D',
                    daysButton: 45,
                  ),
                  ButtonDay(
                    title: '90D',
                    daysButton: 90,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(),
                VariationDetail(
                  title:
                      'Preço atual',
                  number: FormatCurrency.format(criptoModel.currentPrice),
                ),
                const Divider(thickness: 1),
                VariationDetail(
                  title: 'Variação',
                  number:
                      '${criptoModel.variation > 0 ? '+' : ''}${criptoModel.variation.toStringAsFixed(2)}%',
                  color: criptoModel.variation > 0 ? Colors.green : Colors.red,
                  isVariation: true,
                ),
                const Divider(thickness: 1),
                VariationDetail(
                  title: 'Quantidade',
                  number: '${criptoModel.done} ${criptoModel.abbreviation}',
                ),
                const Divider(thickness: 1),
                VariationDetail(
                  title: 'Valor',
                  number: FormatCurrency.format(criptoModel.amount),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const CurrencyConverterButton(),
          ],
        ),
      ),
    );
  }
}
