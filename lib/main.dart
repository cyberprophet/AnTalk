import 'package:antech/cache.dart';
import 'package:antech/router.dart';
import 'package:antech/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  prefs = await SharedPreferences.getInstance();

  await dotenv.load(
    fileName: '.env',
  );
  runApp(
    const ProviderScope(
      observers: [],
      overrides: [],
      child: AnTech(),
    ),
  );
}

class AnTech extends ConsumerWidget {
  const AnTech({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: MaterialApp.router(
          routerConfig: ref.watch(routerProvider),
          theme: theme,
          darkTheme: darkTheme,
        ),
      ),
      designSize: const Size(400, 850),
    );
  }
}
