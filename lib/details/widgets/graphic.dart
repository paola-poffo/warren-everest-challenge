import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/provider/cripto_provider.dart';
import '../../shared/provider/day_provider.dart';
import '../../shared/use_cases/model/cripto_model.dart';
import '../../shared/utils/currency_formatter.dart';

class Graphic extends StatefulHookConsumerWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  ConsumerState<Graphic> createState() => _GraphicState();
}

class _GraphicState extends ConsumerState<Graphic> {
  late int days;
  late CriptoModel criptoModel;

  @override
  Widget build(BuildContext context) {
    criptoModel = ref.watch(criptoProvider.notifier).state;
    days = ref.watch(dayProvider.state).state;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((index) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: const Color.fromRGBO(224, 43, 87, 1),
                      strokeWidth: 3,
                    ),
                    FlDotData(show: false),
                  );
                }).toList();
              },
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: const Color.fromRGBO(224, 43, 87, 1),
                tooltipRoundedRadius: 20,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map(
                    (touchedSpot) {
                      return LineTooltipItem(
                        FormatCurrency.doubleFormat(touchedSpot.y),
                        const TextStyle(color: Colors.white, fontSize: 15),
                      );
                    },
                  ).toList();
                },
              ),
            ),
            titlesData: FlTitlesData(show: false),
            extraLinesData: ExtraLinesData(),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                ),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                barWidth: 3.5,
                color: const Color.fromRGBO(224, 43, 87, 1),
                dotData: FlDotData(show: false),
                isStrokeCapRound: true,
                spots: generateFlSpot(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<FlSpot> generateFlSpot() {
    List<FlSpot> listDays = [];
    if (days != 1) {
      for (int day = 0; day < days; day++) {
        listDays.add(
          FlSpot(
            day.toDouble(),
            criptoModel.allPrices[day].toDouble(),
          ),
        );
      }
      return listDays;
    } else {
      for (int day = 0; day < criptoModel.allPrices.length; day++) {
        listDays.add(
          FlSpot(day.toDouble(), criptoModel.allPrices[day].toDouble()),
        );
      }
      return listDays;
    }
  }
}
