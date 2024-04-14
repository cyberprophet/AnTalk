import 'package:antech/suggest/models/suggest_stock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestTitle extends ConsumerWidget {
  const SuggestTitle({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.cardColor,
            spreadRadius: .5,
            blurRadius: .5,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: theme.canvasColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: (16 + 8).w, vertical: (16).h),
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
    );
  }

  final SuggestStock item;
}
