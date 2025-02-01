import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseBarChart extends StatelessWidget {
  final Map<String, double> monthlyData;
  const ExpenseBarChart({Key? key, required this.monthlyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (monthlyData.isEmpty) {
      return const Center(child: Text('No data available for chart.'));
    }
    final sortedKeys = monthlyData.keys.toList()
      ..sort((a, b) {
        final aParts = a.split('-');
        final bParts = b.split('-');
        final aMonth = int.tryParse(aParts[0]) ?? 0;
        final aYear = int.tryParse(aParts[1]) ?? 0;
        final bMonth = int.tryParse(bParts[0]) ?? 0;
        final bYear = int.tryParse(bParts[1]) ?? 0;
        if (aYear == bYear) {
          return aMonth.compareTo(bMonth);
        }
        return aYear.compareTo(bYear);
      });
    final barGroups = <BarChartGroupData>[];
    for (int i = 0; i < sortedKeys.length; i++) {
      final monthKey = sortedKeys[i];
      final expenseAmount = monthlyData[monthKey]!;
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: expenseAmount,
              color: const Color(0xFF6F35A5),
              width: 16,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );
    }
    final maxExpense = monthlyData.values.reduce((a, b) => a > b ? a : b);
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          maxY: maxExpense * 1.2,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 30,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= sortedKeys.length) {
                    return const SizedBox.shrink();
                  }
                  final key = sortedKeys[index];
                  final parts = key.split('-');
                  final month = parts[0];
                  final year = parts[1];
                  return Text('$month/$year', style: const TextStyle(fontSize: 10));
                },
              ),
            ),
          ),
          barGroups: barGroups,
        ),
      ),
    );
  }
}
