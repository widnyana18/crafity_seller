import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Purchase Curves',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '2020',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                ),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: LineChart(
              curves(),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData curves() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Color(0xFFF3F3F3).withOpacity(.75),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 26,
      maxY: 10,
      minY: 0,
      lineBarsData: [linesBarData],
    );
  }

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
    colors: [Color(0xFFD83B66)],
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
      getDotPainter: (spot, val, chartBar, title) => FlDotCirclePainter(
        color: Color(0xFFD83B66),
        radius: 4,
      ),
    ),
    curveSmoothness: 0,
    belowBarData: BarAreaData(show: false),
  );
}

class AnalyticalTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTable(
          dividerThickness: 0,
          columns: dataTable.keys.map(
            (item) => DataColumn(
              label: Text(
                item,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF747474),
                ),
              ),
            ),
          ),
          rows: List.generate(
            dataTable.values.first.length,
            (i) => DataRow(
              cells: List.generate(dataTable.values.length, (j) {
                if (j == 3) {
                  return DataCell(
                    CircleAvatar(backgroundColor: Color(dataTable[3][i])),
                  );
                }
                return DataCell(Text(dataTable[j][i].toString()));
              }),
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Purchase',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF747474),
                ),
              ),
              SizedBox(width: 22),
              Column(
                children: <Widget>[
                  Text(
                    '800.000 product',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '\$4500',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFC84C6E),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Map<String, List<dynamic>> dataTable = {
    'Month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
    'Product Count': [370, 120, 228, 278, 223, 320],
    'Income(\$)': [410, 810, 270, 219, 790, 229],
    'Status': [
      0xFF6794E3,
      0xFF6794E3,
      0xFFE36778,
      0xFF6794E3,
      0xFFE36778,
      0xFF6794E3
    ],
  };
}
