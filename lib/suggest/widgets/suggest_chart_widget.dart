import 'dart:math';

import 'package:antech/suggest/models/suggest_stock_chart.dart';
import 'package:antech/suggest/models/suggest_stock_volume.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SuggestChart extends StatelessWidget {
  const SuggestChart({
    super.key,
    required this.chart,
    required this.volume,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          height: size.height * .65,
          width: size.width,
          child: _getCandlestickChart(context, theme, chart),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          height: size.height * .2,
          width: size.width,
          child: _getHistogramChart(context, theme, volume),
        )
      ],
    );
  }

  Widget _getHistogramChart(
      BuildContext context, ThemeData theme, List<StockVolume> chart) {
    final parseDate = chart.map((e) => int.tryParse(e.date ?? '') ?? 0);
    final maxVolume = chart.map((e) => e.volume).reduce(max);
    final minVolume = chart.map((e) => e.volume).reduce(min);
    final maxDate = parseDate.reduce(max);
    final minDate = parseDate.reduce(min);

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      primaryYAxis: NumericAxis(
        plotBands: const [],
        isVisible: false,
        maximum: maxVolume.toDouble() + 1,
        minimum: minVolume.toDouble() - 1,
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
      ),
      primaryXAxis: DateTimeCategoryAxis(
        rangePadding: ChartRangePadding.additional,
        isVisible: false,
        maximum: DateTime.tryParse(maxDate.toString()),
        minimum: DateTime.tryParse(minDate.toString()),
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
      ),
      series: _getHistogramSeries(context, theme, chart),
    );
  }

  List<ColumnSeries<StockVolume, DateTime>> _getHistogramSeries(
          BuildContext context, ThemeData theme, List<StockVolume> chart) =>
      [
        ColumnSeries<StockVolume, DateTime>(
          dataSource: chart,
          xValueMapper: (e, _) => DateTime.tryParse(e.date ?? ''),
          yValueMapper: (e, _) => e.volume,
          pointColorMapper: (e, _) => e.color,
          borderWidth: 3,
          emptyPointSettings:
              const EmptyPointSettings(mode: EmptyPointMode.drop),
          animationDuration: 512 + 256,
        )
      ];

  Widget _getCandlestickChart(
      BuildContext context, ThemeData theme, List<ChartModel> chart) {
    final parseDate = chart.map((e) => int.tryParse(e.date ?? '') ?? 0);
    final maxPrice = chart.map((e) => e.high).reduce(max);
    final minPrice = chart.map((e) => e.low).reduce(min);
    final maxDate = parseDate.reduce(max);
    final minDate = parseDate.reduce(min);

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      primaryYAxis: NumericAxis(
        plotBands: const [],
        maximum: maxPrice.toDouble(),
        minimum: minPrice.toDouble(),
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: .25),
        majorTickLines: const MajorTickLines(width: 0),
        opposedPosition: true,
        labelPosition: ChartDataLabelPosition.inside,
        labelStyle: theme.textTheme.labelMedium,
        interval: ((maxPrice - minPrice) ~/ 4).ceilToDouble(),
      ),
      primaryXAxis: DateTimeCategoryAxis(
        rangePadding: ChartRangePadding.additional,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        maximum: DateTime.tryParse(maxDate.toString()),
        minimum: DateTime.tryParse(minDate.toString()),
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: .25),
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
          borderWidth: .75,
          bearColor: theme.colorScheme.onSecondaryContainer,
          bullColor: theme.colorScheme.onPrimaryContainer,
          enableSolidCandles: true,
          showIndicationForSameValues: true,
          emptyPointSettings:
              const EmptyPointSettings(mode: EmptyPointMode.drop),
          animationDuration: 512 + 256,
        )
      ];

  final List<ChartModel> chart;
  final List<StockVolume> volume;
}
