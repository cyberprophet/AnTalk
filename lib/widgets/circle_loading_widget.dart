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
        child: Container(color: Colors.transparent),
      );

  Widget _progressIndicator(BuildContext context) => Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.transparent,
          valueColor:
              AlwaysStoppedAnimation(Theme.of(context).colorScheme.scrim),
        ),
      );

  final AsyncValue<T> provider;
}
