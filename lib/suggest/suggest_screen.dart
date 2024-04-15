import 'dart:io';

import 'package:antech/cache.dart';
import 'package:antech/suggest/widgets/suggest_card_widget.dart';
import 'package:antech/widgets/banner_ads_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
    _createInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    if (ads != null) {
      ads?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const BannerAds(),
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
      final execute = previousIndex == DateTime.now().second % 15;

      if (kDebugMode) {
        print({'previousIndex': previousIndex, 'execute': execute});
      }
      if (execute && ads != null) {
        _showInterstitialAd();
      }
      ref.read(card.suggestProvider.notifier).suggestStock();
    }
    return CardSwiperDirection.bottom != direction &&
        CardSwiperDirection.none != direction;
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialUnitId[Platform.isAndroid ? 'android' : 'ios']!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          if (kDebugMode) {
            print('$ad loaded');
          }
          ad.setImmersiveMode(Platform.isAndroid);

          ads = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (kDebugMode) {
            print('InterstitialAd failed to load: $error.');
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    ads?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        if (kDebugMode) {
          print('$ad onAdShowedFullScreenContent.');
        }
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        if (kDebugMode) {
          print('$ad onAdDismissedFullScreenContent.');
        }
        ad.dispose();

        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        if (kDebugMode) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
        }
        ad.dispose();

        _createInterstitialAd();
      },
    );
    ads?.show();
  }

  InterstitialAd? ads;

  final cards = List<Widget>.empty(growable: true);
}
