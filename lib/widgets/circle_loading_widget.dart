import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CenterCircularProgressIndicator<T> extends StatelessWidget {
  const CenterCircularProgressIndicator({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) => ModalProgressHUD(
      inAsyncCall: provider.isLoading,
      progressIndicator: _progressIndicator(context),
      child: _progressIndicator(context));

  Widget _progressIndicator(BuildContext context) => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(
            MediaQuery.of(context).platformBrightness == Brightness.dark
                ? const Color(0xCFE7AE29)
                : const Color(0xCF512BD4),
          ),
          backgroundColor: Colors.transparent,
        ),
      );

  final AsyncValue<T> provider;
}
