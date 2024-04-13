import 'dart:math';

import 'package:antech/suggest/models/suggest_stock_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SuggestChart extends StatelessWidget {
  const SuggestChart({
    super.key,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      padding: EdgeInsets.symmetric(vertical: (32 + 16).h),
      height: size.height,
      width: size.width,
      child: _getCandlestickChart(context, chart),
    );
  }

  Widget _getCandlestickChart(BuildContext context, List<ChartModel> chart) {
    final parseDate = chart.map((e) => int.tryParse(e.date ?? '') ?? 0);
    final maxPrice = chart.map((e) => e.high).reduce(max);
    final minPrice = chart.map((e) => e.low).reduce(min);
    final maxDate = parseDate.reduce(max);
    final minDate = parseDate.reduce(min);
    final theme = Theme.of(context);

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      primaryYAxis: NumericAxis(
        plotBands: const [],
        isVisible: false,
        maximum: maxPrice.toDouble(),
        minimum: minPrice.toDouble(),
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
      ),
      primaryXAxis: DateTimeCategoryAxis(
        rangePadding: ChartRangePadding.additional,
        isVisible: false,
        maximum: DateTime.tryParse((maxDate + 1).toString()),
        minimum: DateTime.tryParse((minDate - 1).toString()),
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
      ),
      series: _getCandleSeries(context, theme, chart),
    );
  }

  List<CandleSeries<ChartModel, DateTime>> _getCandleSeries(
          BuildContext context, ThemeData theme, List<ChartModel> chart) =>
      [
        CandleSeries(
          closeValueMapper: (m, _) => m.current,
          highValueMapper: (m, _) => m.high,
          lowValueMapper: (m, _) => m.low,
          openValueMapper: (m, _) => m.start,
          xValueMapper: (m, _) => DateTime.tryParse(m.date ?? ''),
          dataSource: chart,
          borderWidth: 0.75,
          bearColor: theme.colorScheme.onSecondaryContainer,
          bullColor: theme.colorScheme.onPrimaryContainer,
          enableSolidCandles: true,
          opacity: 0.575,
          emptyPointSettings: const EmptyPointSettings(
            mode: EmptyPointMode.drop,
            borderColor: Color(0xCE6A0DAD),
            borderWidth: 1,
          ),
          showIndicationForSameValues: true,
        )
      ];

  final List<ChartModel> chart;
}
