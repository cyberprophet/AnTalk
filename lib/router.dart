import 'package:antech/suggest/suggest_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    observers: [],
    initialLocation: SuggestScreen.routeUrl,
    redirect: (context, state) async {
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
