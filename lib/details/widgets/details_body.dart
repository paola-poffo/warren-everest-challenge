// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:warren_everest_challenge/portfolio/model/criptos_view_data.dart';
import 'package:warren_everest_challenge/shared/widgets/default_button.dart';

import '../../shared/utils/arguments.dart';
import '../../shared/utils/currency_formatter.dart';
import '../providers/day_provider.dart';
import '../usecase/cripto_market_provider.dart';
import 'details_button_day.dart';
import 'details_custom_linechart.dart';
import 'details_header_balance.dart';
import 'details_variation.dart';

class DetailsBody extends HookConsumerWidget {
  const DetailsBody({
    Key? key,
    required this.criptosViewData,
    required this.criptoConversion,
  }) : super(key: key);

  final CriptoViewData criptosViewData;
  final double criptoConversion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var days = ref.watch(dayProvider);
    final marketData = ref.watch(marketProvider(criptosViewData.id));

    return marketData.when(
      data: ((data) {
        final changeVariation =
            (data.prices.last.last / data.prices.reversed.elementAt(days).last - 1) * 100;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                DetailsHeaderBalance(criptosViewData: criptosViewData),
                DetailsCustomLineChart(
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
                      DetailsButtonDay(
                        title: '5D',
                        daysButton: 5,
                      ),
                      DetailsButtonDay(
                        title: '15D',
                        daysButton: 15,
                      ),
                      DetailsButtonDay(
                        title: '30D',
                        daysButton: 30,
                      ),
                      DetailsButtonDay(
                        title: '45D',
                        daysButton: 45,
                      ),
                      DetailsButtonDay(
                        title: '90D',
                        daysButton: 90,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(thickness: 1),
                    DetailsVariation(
                      title: 'Preço atual',
                      number: FormatCurrency.format(
                        criptosViewData.currentPrice,
                      ),
                    ),
                    const Divider(thickness: 1),
                    DetailsVariation(
                        title: 'Variação em $days dias',
                        color: changeVariation > 0 ? Colors.green : Colors.red,
                        number:
                            '${changeVariation > 0 ? '+' : ''} ${changeVariation.toStringAsFixed(2)}%'),
                    const Divider(thickness: 1),
                    DetailsVariation(
                      title: 'Quantidade',
                      number:
                          '${criptoConversion.toStringAsFixed(2)} ${criptosViewData.symbol.toUpperCase()}',
                    ),
                    const Divider(thickness: 1),
                    DetailsVariation(
                      title: 'Valor',
                      number:
                          FormatCurrency.format(criptosViewData.currentPrice),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                DefaultButton(
                  argument: Argument(
                    criptosViewData: criptosViewData,
                    criptoConversion: criptoConversion,
                  ),
                  label: 'Converter moeda',
                  route: '/conversion',
                ),
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
