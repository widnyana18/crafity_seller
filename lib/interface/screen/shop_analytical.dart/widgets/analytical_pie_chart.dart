import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class AnalyticalPieChart extends StatefulWidget {
  @override
  _AnalyticalPieChartState createState() => _AnalyticalPieChartState();
}

class _AnalyticalPieChartState extends State<AnalyticalPieChart> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Text(
            'Financial Percentage',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    chartData(),
                    swapAnimationDuration: Duration(milliseconds: 250),
                  ),
                ),
              ),
              SizedBox(width: 20),
              chartIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget chartIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: indicator
          .map(
            (item) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color(item.color),
                    radius: 10,
                  ),
                  SizedBox(width: 14),
                  Text(item.label),
                ],
              ),
            ),
          )
          .toList()
            ..insert(
              0,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Aggregation',
                    suffix: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(
                          value: 'Kilo',
                          child: Text('Kilo'),
                        ),
                        DropdownMenuItem(
                          value: 'Million',
                          child: Text('Million'),
                        ),
                        DropdownMenuItem(
                          value: 'Billion',
                          child: Text('Billion'),
                        ),
                      ],
                      onChanged: (_) {},
                      value: 'Milion',
                      icon: Icon(Icons.expand_more),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
    );
  }

  PieChartData chartData() {
    return PieChartData(
      pieTouchData: PieTouchData(
        touchCallback: (pieTouchResponse) {
          setState(() {
            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                pieTouchResponse.touchInput is FlPanEnd) {
              touchedIndex = -1;
            } else {
              touchedIndex = pieTouchResponse.touchedSectionIndex;
            }
          });
        },
      ),
      borderData: FlBorderData(
        show: false,
      ),
      sectionsSpace: 0,
      centerSpaceRadius: 40,
      sections: showingSections(),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      final textStyle = TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
      );

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: textStyle,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: textStyle,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: textStyle,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xFFF66C6C),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: textStyle,
          );
        default:
          return null;
      }
    });
  }

  List<IndicatorAtr> indicator = [
    IndicatorAtr(
      label: 'Model',
      color: 0xff0293ee,
    ),
    IndicatorAtr(
      label: 'Income',
      color: 0xff13d38e,
    ),
    IndicatorAtr(
      label: 'Profit',
      color: 0xfff8b250,
    ),
    IndicatorAtr(
      label: 'Debt',
      color: 0xFFF66C6C,
    )
  ];
}

class IndicatorAtr {
  IndicatorAtr({this.label, this.color});

  final String label;
  final int color;
}
