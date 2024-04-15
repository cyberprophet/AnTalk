import 'package:antech/cache.dart';
import 'package:antech/suggest/suggest_screen.dart';
import 'package:antech/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    observers: [],
    initialLocation: SuggestScreen.routeUrl,
    redirect: (context, state) async {
      await appUpdate();

      if (bearerToken != null && bearerToken!.isNotEmpty) {}
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: SuggestScreen.routeUrl,
            name: SuggestScreen.routeName,
            builder: (context, state) => const SuggestScreen(),
          )
        ],
      )
    ],
  ),
);
