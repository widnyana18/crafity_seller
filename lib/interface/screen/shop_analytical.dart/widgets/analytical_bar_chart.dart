import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticalBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              'Purchase Comparison',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BarChart(
                chartData(),
                swapAnimationDuration: Duration(milliseconds: 250),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartData chartData() {
    return BarChartData(
      alignment: BarChartAlignment.spaceBetween,
      barTouchData: BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.all(0),
          tooltipBottomMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.toString(),
              TextStyle(
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(fontSize: 15),
          margin: 20,
          getTitles: horizontalTitles,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(fontSize: 15),
          margin: 10,
          getTitles: verticalTitles,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8E8E8),
            width: 3,
          ),
        ),
      ),
      maxY: 20,
      barGroups: barGroupData.map(
        (item) => BarChartGroupData(
          x: item[0].toInt(),
          barRods: [
            BarChartRodData(
              y: item[1],
              colors: [Color(0xFFDBDBDB)],
              width: 30,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      ),
    );
  }

  String Function(double) horizontalTitles = (value) {
    switch (value.toInt()) {
      case 1:
        return '2020';
      case 2:
        return '2021';
      case 3:
        return '2022';
      case 4:
        return '2023';
      case 5:
        return '2024';
      case 6:
        return '2025';
      case 7:
        return '2026';
      case 8:
        return '2027';
      case 9:
        return '2028';
      case 10:
        return '2029';
    }
    return '';
  };

  String Function(double) verticalTitles = (value) {
    switch (value.toInt()) {
      case 2:
        return '1M';
      case 4:
        return '2M';
      case 6:
        return '3M';
      case 8:
        return '4M';
      case 10:
        return '5M';
      case 12:
        return '6M';
      case 14:
        return '7M';
      case 16:
        return '8M';
      case 18:
        return '9M';
      case 20:
        return '10M';
    }
    return '';
  };

  Iterable<List<double>> barGroupData = [
    [1, 4.1],
    [2, 1.5],
    [3, 2.6],
    [4, 3.3],
    [5, 4.7],
    [6, 6.6],
    [7, 5.3],
    [8, 9.4],
    [9, 8.2],
    [10, 6.7]
  ];
}
