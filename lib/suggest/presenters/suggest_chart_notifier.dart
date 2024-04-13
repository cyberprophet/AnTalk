import 'dart:async';

import 'package:antech/api.dart';
import 'package:antech/suggest/models/suggest_stock_chart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestChartNotifier
    extends FamilyAsyncNotifier<List<ChartModel>, String?> {
  @override
  FutureOr<List<ChartModel>> build(arg) async {
    _api = ref.read(api);

    final response = await _api
        .getAsync('${dotenv.env['DAY_CHART']}?code=$arg&period=${64 + 32}');

    if (response is Map<String, dynamic> && response['chart'] is List) {
      _chart = (response['chart'] as List)
          .map((e) => ChartModel.fromJson(e))
          .toList();

      return _chart;
    }
    return [];
  }

  late final List<ChartModel> _chart;
  late final ApiProvider _api;
}

final chartProvider = AsyncNotifierProviderFamily<SuggestChartNotifier,
    List<ChartModel>, String?>(SuggestChartNotifier.new);
