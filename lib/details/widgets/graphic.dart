import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              barWidth: 3.5,
              color: const Color.fromRGBO(224, 43, 87, 1),
              dotData: FlDotData(show: false),
              spots: const [
                FlSpot(0, 3),
                FlSpot(3, 7),
                FlSpot(7, 1),
                FlSpot(8, 3),
              ],
            ),
          ],
          betweenBarsData: [],
          titlesData: FlTitlesData(show: false),
          extraLinesData: ExtraLinesData(),
          lineTouchData: LineTouchData(enabled: true),
          rangeAnnotations: RangeAnnotations(),
          showingTooltipIndicators: [],
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(
                width: 2,
                color: Color.fromARGB(156, 180, 181, 193),
              ),
            ),
          ),
          minX: 0,
          maxX: 10,
          baselineX: 3,
          minY: 0,
          maxY: 15,
          baselineY: 3,
          clipData: FlClipData.none(),
        ),
      ),
    );
  }
}
