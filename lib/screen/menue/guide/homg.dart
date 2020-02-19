import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';

/// Data class to visualize.
class _SalesData {
  final int year;
  final int sales;

  _SalesData(this.year, this.sales);
  // Returns Jan.1st of that year as date.
  DateTime get date => DateTime(this.year, 1, 1);
}

/// Generate some random data.
List<_SalesData> _genRandData() {
  final random = Random();
  // Returns an increasing series with some fluctuations.
  return [
    for (int i = 2015; i < 2020; ++i)
      _SalesData(i, (i - 2015) * 10 + random.nextInt(10)),
  ];
}

class TimeseriesChartExample extends StatefulWidget {
  const TimeseriesChartExample({Key key}) : super(key: key);

  @override
  _TimeseriesChartExampleState createState() => _TimeseriesChartExampleState();
}

class _TimeseriesChartExampleState extends State<TimeseriesChartExample> {
  // Chart configs.
  bool _animate = true;
  bool _defaultInteractions = true;
  bool _includeArea = true;
  bool _includePoints = true;
  bool _stacked = true;
  charts.BehaviorPosition _titlePosition = charts.BehaviorPosition.bottom;
  charts.BehaviorPosition _legendPosition = charts.BehaviorPosition.bottom;

  // Data to render.
  List<_SalesData> _series1, _series2;

  @override
  void initState() {
    super.initState();
    this._series1 = _genRandData();
    this._series2 = _genRandData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        SizedBox(height: 25),
        Center(
          child: Text(
            'Your performance past Years',
            style: GoogleFonts.comfortaa(fontSize: 20),
          ),
        ),
        Container(
          height: 300,
          child: charts.TimeSeriesChart(
            /*seriesList=*/ [
              charts.Series<_SalesData, DateTime>(
                id: 'Bookings',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (_SalesData sales, _) => sales.date,
                measureFn: (_SalesData sales, _) => sales.sales,
                data: this._series1,
              ),
              charts.Series<_SalesData, DateTime>(
                id: 'profile Visit\'s',
                colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                domainFn: (_SalesData sales, _) => sales.date,
                measureFn: (_SalesData sales, _) => sales.sales,
                data: this._series2,
              ),
            ],
            defaultInteractions: this._defaultInteractions,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: this._includePoints,
              includeArea: this._includeArea,
              stacked: this._stacked,
            ),
            animate: this._animate,
            behaviors: [
              // Add title.
              charts.ChartTitle('Dummy sales time series',
                  behaviorPosition: _titlePosition),
              // Add legend.
              charts.SeriesLegend(position: _legendPosition),
              // Highlight X and Y value of selected point.
              charts.LinePointHighlighter(
                showHorizontalFollowLine:
                    charts.LinePointHighlighterFollowLineType.all,
                showVerticalFollowLine:
                    charts.LinePointHighlighterFollowLineType.nearest,
              ),
            ],
          ),
        ),
        Divider(),
        Text('Tips to improve', style: GoogleFonts.comfortaa(fontSize: 30))
      ],
    ));
  }

  /// Widgets to control the chart appearance and behavior.
}
