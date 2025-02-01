import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class ExpenseChart extends StatelessWidget {
  final Map<String, double> monthlyData;
  const ExpenseChart({Key? key, required this.monthlyData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (monthlyData.isEmpty) return Center(child: Text('No data'));
    final sortedKeys = monthlyData.keys.toList()..sort((a, b) => a.compareTo(b));
    final barGroups = sortedKeys.asMap().entries.map((e) {
      int index = e.key;
      double value = monthlyData[e.value]!;
      return BarChartGroupData(x: index, barRods: [BarChartRodData(toY: value, width: 16, color: Theme.of(context).primaryColor)]);
    }).toList();
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          maxY: monthlyData.values.reduce((a, b) => a > b ? a : b) * 1.2,
          barGroups: barGroups,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) {
              int index = value.toInt();
              return Text(sortedKeys[index]);
            })),
          ),
        ),
      ),
    );
  }
}
