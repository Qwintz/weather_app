import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/location_page.dart';
import '../pages/onboarding_page.dart';
import '../pages/settings_page.dart';
import '../pages/weather_page.dart';
import '../utils/constants/pages.dart';
import '../utils/helpers/storage.dart';

class AppRouter {
  AppRouter(this._storage) {
    router = GoRouter(
      routes: [
        GoRoute(
          name: Pages.onboarding,
          path: "/${Pages.onboarding}",
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const OnboardingPage(),
          ),
        ),
        GoRoute(
          name: Pages.weather,
          path: "/",
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: WeatherPage(initialPage: state.extra as int?),
          ),
          routes: [
            GoRoute(
              name: Pages.location,
              path: Pages.location,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const LocationPage(),
              ),
            ),
            GoRoute(
              name: Pages.settings,
              path: Pages.settings,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const SettingsPage(),
              ),
            ),
          ],
        ),
      ],
      redirect: _redirect,
    );
  }

  final Storage _storage;

  late final GoRouter router;

  String? _redirect(BuildContext _, GoRouterState __) {
    final isOnboardingAlreadySeen = _storage.getOnboadingFlag() ?? false;
    if (!isOnboardingAlreadySeen) {
      return "/${Pages.onboarding}";
    }
    return null;
  }
}
