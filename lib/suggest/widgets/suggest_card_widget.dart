import 'package:antech/suggest/models/suggest_stock_model.dart';
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

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardColor,
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
        data: (item) => Stack(fit: StackFit.expand, children: [
          Positioned(
            bottom: 0,
            child: SuggestTitle(item: item),
          ),
          Positioned(
              top: 0,
              child: ref.watch(chartProvider(item.code)).when(
                    loading: () =>
                        CenterCircularProgressIndicator(provider: provider),
                    error: (error, _) => ErrorText(error: error.toString()),
                    data: (chart) => SuggestChart(chart: chart),
                  ))
        ]),
      ),
    );
  }
}
