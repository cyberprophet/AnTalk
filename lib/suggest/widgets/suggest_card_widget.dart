import 'package:antech/suggest/models/suggest_stock_chart.dart';
import 'package:antech/suggest/models/suggest_stock_model.dart';
import 'package:antech/suggest/models/suggest_stock_volume.dart';
import 'package:antech/suggest/presenters/suggest_chart_notifier.dart';
import 'package:antech/suggest/presenters/suggest_stock_notifier.dart';
import 'package:antech/suggest/widgets/suggest_chart_widget.dart';
import 'package:antech/suggest/widgets/suggest_title_widget.dart';
import 'package:antech/widgets/circle_loading_widget.dart';
import 'package:antech/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestCard extends ConsumerWidget {
  SuggestCard({
    super.key,
  });
  final suggestProvider =
      AsyncNotifierProvider<SuggestStockNotifier, SuggestStock>(
          () => SuggestStockNotifier());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(suggestProvider);
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: theme.cardColor,
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: provider.when(
        loading: () => CenterCircularProgressIndicator(provider: provider),
        error: (error, _) => ErrorText(error: error.toString()),
        data: (item) => Stack(children: [
          Positioned(
              top: 0,
              child: ref.watch(chartProvider(item.code)).when(
                    loading: () =>
                        CenterCircularProgressIndicator(provider: provider),
                    error: (error, _) => ErrorText(error: error.toString()),
                    data: (chart) => SuggestChart(
                      chart: chart,
                      volume: _setStockVolume(theme, chart),
                    ),
                  )),
          Positioned(
            bottom: 0,
            child: SuggestTitle(item: item),
          ),
        ]),
      ),
    );
  }

  List<StockVolume> _setStockVolume(ThemeData theme, List<ChartModel> chart) {
    List<StockVolume> list = List.empty(growable: true);

    for (int index = 0; index < chart.length; index++) {
      final cm = chart[index];
      final color = index > 0 && cm.volume > chart[index - 1].volume
          ? theme.colorScheme.onPrimaryContainer
          : theme.colorScheme.onSecondaryContainer;

      list.add(StockVolume.fromChart(cm.date, cm.volume, color));
    }
    return list;
  }
}
