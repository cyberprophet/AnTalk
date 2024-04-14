import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

String? bearerToken;

Map<String, String> bannerUnitId = kDebugMode
    ? {
        'ios': 'ca-app-pub-3940256099942544/2934735716',
        'android': 'ca-app-pub-3940256099942544/6300978111',
      }
    : {
        'ios': '${dotenv.env['IOS_BANNER']}',
        'android': '${dotenv.env['ANDROID_BANNER']}',
      };

Map<String, String> interstitialUnitId = kDebugMode
    ? {
        'ios': 'ca-app-pub-3940256099942544/4411468910',
        'android': 'ca-app-pub-3940256099942544/1033173712',
      }
    : {
        'ios': '${dotenv.env['IOS_INTERSTITIAL_AD']}',
        'android': '${dotenv.env['ANDROID_INTERSTITIAL_AD']}',
      };
