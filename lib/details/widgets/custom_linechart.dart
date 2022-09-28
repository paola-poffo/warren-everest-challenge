import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/currency_formatter.dart';
import '../providers/day_provider.dart';

class CustomLineChart extends HookConsumerWidget {
  final List<FlSpot> list;
  const CustomLineChart({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        FormatCurrency.format(touchedSpot.y),
                        const TextStyle(color: Colors.white, fontSize: 15),
                      );
                    },
                  ).toList();
                },
              ),
            ),
            titlesData: FlTitlesData(show: false),
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
                spots: list.sublist(0, ref.watch(dayProvider)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
