import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:in_app_update/in_app_update.dart';

Future appUpdate() async {
  if (Platform.isAndroid) {
    try {
      final appUpdateInfo = await InAppUpdate.checkForUpdate();

      if (UpdateAvailability.updateAvailable ==
          appUpdateInfo.updateAvailability) {
        InAppUpdate.startFlexibleUpdate().then((result) {
          if (AppUpdateResult.success != result) {
            if (kDebugMode) {
              print('startFlexibleUpdate:: $result');
            }
          }
          InAppUpdate.performImmediateUpdate().then((value) {
            if (kDebugMode) {
              print('performImmediateUpdate:: ${value.name}');
            }
          });
        }).catchError((error) {
          if (kDebugMode) {
            print('startFlexibleUpdate:: $error');
          }
        });
        InAppUpdate.completeFlexibleUpdate().catchError((error) {
          if (kDebugMode) {
            print('completeFlexibleUpdate:: $error');
          }
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('appUpdate:: $error');
      }
    }
  }
  if (Platform.isIOS) {}
  FlutterNativeSplash.remove();
}

const String dateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS";
