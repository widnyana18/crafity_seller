import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticalLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          color: Colors.white,
          elevation: 8,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Purchase Curves',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '2020',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: LineChart(
                      chartData(),
                      swapAnimationDuration: Duration(milliseconds: 250),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.event_note),
                    color: Color(0xFF858585),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData chartData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Color(0xFFF3F3F3).withOpacity(.75),
          getTooltipItems: (spots) {
            return spots.map(
              (spot) => LineTooltipItem(
                '\$${spot.y.toString()}',
                TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
        handleBuiltInTouches: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => TextStyle(fontSize: 15),
          margin: 12,
          getTitles: horizontalTitles,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(fontSize: 15),
          getTitles: verticalTitles,
          margin: 8,
          reservedSize: 30,
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
      minX: 0,
      maxX: 26,
      maxY: 10,
      minY: 0,
      lineBarsData: [linesBarData],
    );
  }

  String Function(double) horizontalTitles = (value) {
    switch (value.toInt()) {
      case 2:
        return 'JAN';
      case 4:
        return 'FEB';
      case 6:
        return 'MAR';
      case 8:
        return 'APR';
      case 10:
        return 'MAY';
      case 12:
        return 'JUN';
      case 14:
        return 'JUL';
      case 16:
        return 'AUG';
      case 18:
        return 'SEPT';
      case 20:
        return 'OCT';
      case 22:
        return 'NOV';
      case 24:
        return 'DEC';
      default:
        return '';
    }
  };

  String Function(double) verticalTitles = (value) {
    switch (value.toInt()) {
      case 1:
        return '1M';
      case 2:
        return '2M';
      case 3:
        return '3M';
      case 4:
        return '4M';
      case 5:
        return '5M';
      case 6:
        return '6M';
      case 7:
        return '7M';
      case 8:
        return '8M';
      case 9:
        return '9M';
      case 10:
        return '10M';
      default:
        return '';
    }
  };

  LineChartBarData linesBarData = LineChartBarData(
    spots: [
      FlSpot(2, 1),
      FlSpot(4, 1.5),
      FlSpot(6, 3.2),
      FlSpot(8, 2.6),
      FlSpot(10, 2),
      FlSpot(12, 4.6),
      FlSpot(14, 5.3),
      FlSpot(16, 7.4),
      FlSpot(18, 6.3),
      FlSpot(20, 5.8),
      FlSpot(22, 6.6),
      FlSpot(24, 7.8),
    ],
    isCurved: true,
    colors: [
      Color(0xFFD83B66),
    ],
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(show: true),
    curveSmoothness: 0,
    belowBarData: BarAreaData(show: false),
  );
}
