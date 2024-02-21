import 'package:expense_tracker/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Grpah extends StatelessWidget {
  final List weeklySummary;
  const Grpah({required this.weeklySummary, super.key});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sundayExp: weeklySummary[0],
      mondayExp: weeklySummary[1],
      tuesdayExp: weeklySummary[2],
      wednesdayExp: weeklySummary[3],
      thursdayExp: weeklySummary[4],
      fridayExp: weeklySummary[5],
      saturdayExp: weeklySummary[6],
    );
    myBarData.intializeBarData();
    return BarChart(BarChartData(
        maxY: 200,
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getbottomTiles),
          ),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.grey[800],
                      width: 25,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 200,
                        color: Colors.grey[100],
                      )),
                ],
              ),
            )
            .toList()));
  }
}

Widget getbottomTiles(double values, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  Widget text;
  switch (values.toInt()) {
    case 0:
      text = const Text(
        "S",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "M",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "T",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "W",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "TH",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "F",
        style: style,
      );
      break;
    case 6:
      text = const Text(
        "Sa",
        style: style,
      );
    default:
      text = const Text(
        "",
        style: style,
      );
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
