import 'package:antech/suggest/widgets/suggest_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestScreen extends ConsumerStatefulWidget {
  const SuggestScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SuggestState();
  }

  static const String routeName = 'suggest';
  static const String routeUrl = '/suggest';
}

class _SuggestState extends ConsumerState {
  @override
  void initState() {
    while (cards.length < 0x10) {
      cards.add(SuggestCard());
    }
    cards.add(Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Placeholder(),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        actions: const [],
      ),
      body: SafeArea(
        child: CardSwiper(
          cardBuilder: (
            context,
            index,
            horizontalOffsetPercentage,
            verticalOffsetPercentage,
          ) =>
              cards[index],
          onSwipe: _onSwipe,
          padding: const EdgeInsets.all(0),
          maxAngle: 70,
          scale: 0.975,
          threshold: 100,
          allowedSwipeDirection: const AllowedSwipeDirection.only(
            left: true,
            right: true,
            up: true,
          ),
          backCardOffset: Offset.zero,
          duration: const Duration(milliseconds: 512),
          cardsCount: cards.length,
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }

  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    final card = cards[previousIndex];

    if (card is SuggestCard) {
      ref.read(card.suggestProvider.notifier).suggestStock();
    }
    return CardSwiperDirection.bottom != direction &&
        CardSwiperDirection.none != direction;
  }

  final cards = List<Widget>.empty(growable: true);
}
