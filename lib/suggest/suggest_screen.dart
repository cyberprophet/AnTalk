import 'package:antech/suggest/presenters/suggest_presenter.dart';
import 'package:antech/widgets/circle_loading_widget.dart';
import 'package:antech/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SuggestScreen extends ConsumerWidget {
  const SuggestScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(suggestProvider);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: provider.isLoading,
        progressIndicator: const CenterCircularProgressIndicator(),
        child: provider.when(
          loading: () => const CenterCircularProgressIndicator(),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          data: (stock) => Center(
            child: Text(stock.name ?? ''),
          ),
        ),
      ),
    );
  }

  static const String routeName = 'suggest';
  static const String routeUrl = '/suggest';
}
