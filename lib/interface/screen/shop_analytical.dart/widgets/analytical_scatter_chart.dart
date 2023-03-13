import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class AnalyticalScatterChart extends StatefulWidget {
  @override
  _AnalyticalScatterChartState createState() => _AnalyticalScatterChartState();
}

class _AnalyticalScatterChartState extends State<AnalyticalScatterChart> {
  List<int> selectedSpots;
  int lastPanStartOnIndex;
  List<int> spotColors = List.generate(
    10,
    (idx) => (math.Random().nextDouble() * 0xFFFFFFFF).toInt(),
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: AspectRatio(
        aspectRatio: 1.3,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          color: Colors.white,
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Best Selling',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: ScatterChart(chartData()),
                    ),
                    SizedBox(width: 20),
                    Flexible(child: legendBar()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: ScatterChart(
              chartData(),
              swapAnimationDuration: Duration(milliseconds: 250),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: legendBar(),
          ),
        ],
      ),
    );
  }

  Widget legendBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'May 2020',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12),
        Divider(),
        SizedBox(height: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            indicator.length,
            (idx) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color(spotColors[idx]),
                    radius: 9,
                    child: Text(
                      idx.toString(),
                      style: TextStyle(
                        color: Color(0xFFD5D5D5),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    indicator[idx],
                    style: TextStyle(
                      color: Color(spotColors[idx]),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ScatterChartData chartData() {
    final min = 1.5;
    final double max = 20;

    return ScatterChartData(
      scatterSpots: List.generate(
        10,
        (idx) {
          return ScatterSpot(
            math.Random().nextDouble() * (max - min) + min,
            math.Random().nextDouble() * (max - min) + min,
            color: Color(spotColors[idx]),
            radius: math.Random().nextDouble() * 42 + 8,
          );
        },
      ),
      minX: 0,
      maxX: max,
      minY: 0,
      maxY: max,
      showingTooltipIndicators: selectedSpots,
      scatterTouchData: ScatterTouchData(
        enabled: true,
        handleBuiltInTouches: false,
        touchTooltipData: ScatterTouchTooltipData(
          tooltipBgColor: Color(0xFFD5D5D5),
        ),
        touchCallback: (ScatterTouchResponse touchResponse) {
          if (touchResponse.touchInput is FlPanStart) {
            lastPanStartOnIndex = touchResponse.touchedSpotIndex;
          } else if (touchResponse.touchInput is FlPanEnd) {
            final FlPanEnd flPanEnd = touchResponse.touchInput;

            if (flPanEnd.velocity.pixelsPerSecond <= const Offset(4, 4)) {
              // Tap happened
              setState(
                () {
                  if (selectedSpots.contains(lastPanStartOnIndex)) {
                    selectedSpots.remove(lastPanStartOnIndex);
                  } else {
                    selectedSpots.add(lastPanStartOnIndex);
                  }
                },
              );
            }
          }
        },
      ),
    );
  }

  List<String> indicator = [
    'Paramecium Rodes',
    'Pan Ciano',
    'Rowel chain',
    'Garra Art',
    'Moguel Statue',
    'Garuda',
    'Tenun T-shirt',
    'Bamboo Beg',
    'Wayang',
    'Disk Asback'
  ];
}
