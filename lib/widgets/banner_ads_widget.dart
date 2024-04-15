import 'dart:io';

import 'package:antech/cache.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatelessWidget {
  const BannerAds({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        child: AdWidget(
          ad: BannerAd(
            listener: BannerAdListener(
              onAdFailedToLoad: (Ad ad, LoadAdError error) {},
              onAdLoaded: (_) {},
            ),
            size: AdSize.banner,
            adUnitId: bannerUnitId[Platform.isAndroid ? 'android' : 'ios']!,
            request: const AdRequest(),
          )..load(),
        ),
      );
}
