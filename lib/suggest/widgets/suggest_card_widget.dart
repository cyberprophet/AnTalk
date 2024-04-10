import 'package:antech/suggest/models/suggest_stock.dart';
import 'package:antech/suggest/presenters/suggest_presenter.dart';
import 'package:antech/widgets/circle_loading_widget.dart';
import 'package:antech/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SuggestCard extends ConsumerWidget {
  SuggestCard({
    super.key,
  });
  final suggestProvider = AsyncNotifierProvider<SuggestPresenter, SuggestStock>(
      () => SuggestPresenter());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(suggestProvider);

    return ModalProgressHUD(
      inAsyncCall: provider.isLoading,
      progressIndicator: const CenterCircularProgressIndicator(),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF696969).withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: provider.when(
          loading: () => const CenterCircularProgressIndicator(),
          error: (error, _) => ErrorText(error: error.toString()),
          data: (item) => Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: (16 + 8).w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: (4).w),
                        child: Text(
                          '${item.code}',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Text(
                        '${item.name}',
                        style: Theme.of(context).textTheme.displayLarge,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
