import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/portfolio/model/criptos_view_data.dart';
import '../usecase/cripto_market_provider.dart';
import 'button_day.dart';
import 'variation_detail.dart';
import '../providers/day_provider.dart';
import '../../shared/utils/currency_formatter.dart';
import 'header_balance.dart';
import 'custom_linechart.dart';

class BodyDetails extends HookConsumerWidget {
  const BodyDetails({
    Key? key,
    required this.criptosViewData,
  }) : super(key: key);

  final CriptoViewData criptosViewData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var days = ref.watch(dayProvider);
    final marketData = ref.watch(marketProvider(criptosViewData.id));

    return marketData.when(
      data: ((data) {
        final changeVariation =
            (data.prices.last.last / data.prices.reversed.elementAt(days).last -
                    1) *
                100;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                HeaderBalance(criptosViewData: criptosViewData),
                CustomLineChart(
                  list: List<FlSpot>.from(
                    data.prices.reversed.map(
                      (cripto) => FlSpot(
                        cripto[0].toDouble(),
                        cripto[1].toDouble(),
                      ),
                    ),
                  ),
                ),
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
                    const Divider(thickness: 1),
                    VariationDetail(
                      title: 'Preço atual',
                      number: FormatCurrency.format(
                        criptosViewData.currentPrice,
                      ),
                    ),
                    const Divider(thickness: 1),
                    VariationDetail(
                        title: 'Variação em $days dias',
                        color: changeVariation > 0 ? Colors.green : Colors.red,
                        number:
                            '${changeVariation > 0 ? '+' : ''} ${changeVariation.toStringAsFixed(2)}%'),
                    const Divider(thickness: 1),
                    VariationDetail(
                      title: 'Quantidade',
                      number:
                          '${criptosViewData.currentPrice.toStringAsFixed(1).replaceAll(".", ",")} ${criptosViewData.symbol.toUpperCase()}',
                    ),
                    const Divider(thickness: 1),
                    VariationDetail(
                      title: 'Valor',
                      number:
                          FormatCurrency.format(criptosViewData.currentPrice),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // const CurrencyConverterButton(criptosViewData: null,),
              ],
            ),
          ),
        );
      }),
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
