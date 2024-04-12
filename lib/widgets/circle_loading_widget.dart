import 'package:flutter/material.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(
            MediaQuery.of(context).platformBrightness == Brightness.dark
                ? const Color(0xCFE7AE29)
                : const Color(0xCF512BD4),
          ),
          backgroundColor: Colors.transparent,
        ),
      );
}
