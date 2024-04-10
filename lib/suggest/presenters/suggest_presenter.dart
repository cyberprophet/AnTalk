import 'dart:async';

import 'package:antech/api.dart';
import 'package:antech/suggest/models/suggest_stock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestPresenter extends AsyncNotifier<SuggestStock> {
  @override
  FutureOr<SuggestStock> build() async {
    _api = ref.read(api);

    final response = _api.getAsync('${dotenv.env['SUGGEST']}');

    return SuggestStock.fromJson(await response);
  }

  Future suggestStock() async {
    final response = await _api.getAsync('${dotenv.env['SUGGEST']}');

    if (kDebugMode) {
      print('SuggestPresenter:: $response');
    }
    state = AsyncData(SuggestStock.fromJson(response));
  }

  late final ApiProvider _api;
}
