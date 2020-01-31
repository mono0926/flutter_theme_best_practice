import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final onError = colorScheme.onError;
    return Theme(
      data: theme.copyWith(
        textTheme: theme.textTheme.apply(
          bodyColor: onError,
          displayColor: onError,
        ),
      ),
      child: AnalyticsCard(
        titleLabel: 'Error',
        valueLabel: 'N/A',
        subValueLabel: 'No data available',
        cardColor: colorScheme.error,
      ),
    );
  }
}

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({
    Key key,
    @required this.titleLabel,
    @required this.valueLabel,
    this.subValueLabel,
    this.cardColor,
    this.showBarChart = false,
    this.showLineChart = false,
    this.showSaveButton = false,
  }) : super(key: key);

  final String titleLabel;
  final String valueLabel;
  final String subValueLabel;
  final bool showBarChart;
  final bool showLineChart;
  final bool showSaveButton;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              titleLabel,
              style: textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            Text(
              valueLabel,
              style: textTheme.headline4,
            ),
            if (subValueLabel != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  subValueLabel,
                  style: textTheme.bodyText1,
                ),
              ),
            if (showBarChart)
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: _BarChart(),
              ),
            if (showLineChart)
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: _LineChart(),
              ),
            if (showSaveButton)
              Container(
                padding: const EdgeInsets.only(top: 8),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 2.5,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final data = <double>[1, 2, 3, 4, 8, 6, 5];
          final borderWidth = (width - (data.length - 1) * 2) / data.length;
          return BarChart(
            BarChartData(
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: data
                  .map((y) => _makeGroupData(
                        y,
                        colorScheme: colorScheme,
                        width: borderWidth,
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  BarChartGroupData _makeGroupData(
    double y, {
    @required ColorScheme colorScheme,
    @required double width,
  }) {
    return BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          y: y,
          color: colorScheme.onSurfaceVariant,
          width: width,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 2.5,
      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 50),
                FlSpot(1, 20),
                FlSpot(2, 30),
                FlSpot(3, 10),
                FlSpot(4, 15),
                FlSpot(5, 5),
                FlSpot(6, 30),
                FlSpot(7, 40),
                FlSpot(8, 35),
                FlSpot(9, 50),
                FlSpot(10, 48),
                FlSpot(11, 60),
                FlSpot(12, 70),
                FlSpot(13, 75),
                FlSpot(14, 68),
              ],
              colors: [
                colorScheme.onSurfaceVariant,
              ],
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
