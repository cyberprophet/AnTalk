import 'dart:async';

import 'package:antech/api.dart';
import 'package:antech/suggest/models/suggest_stock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestPresenter extends AsyncNotifier<SuggestStock> {
  @override
  FutureOr<SuggestStock> build() async {
    return await _suggestStock();
  }

  Future<SuggestStock> _suggestStock() async {
    final response = await _api.getAsync(dotenv.env['SUGGEST']!);

    if (kDebugMode) {
      print('SuggestPresenter:: $response');
    }
    return SuggestStock.fromJson(response);
  }

  final _api = ApiProvider();
}

final suggestProvider = AsyncNotifierProvider<SuggestPresenter, SuggestStock>(
    () => SuggestPresenter());
