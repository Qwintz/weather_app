import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart';
import 'features/settings/cubit/settings_cubit.dart';
import 'features/settings/models/ui_settings.dart';
import 'features/weather/cubit/weather_cubit.dart';
import 'features/weather/repositories/location_repository.dart';
import 'router/router.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'utils/helpers/snackbar_utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => Di.get<WeatherCubit>()
            ..loadWeather()
            ..updateAllWeather(),
        ),
        BlocProvider(
          create: (_) => Di.get<SettingsCubit>()..loadSettings(),
        ),
        RepositoryProvider(
          create: (_) => Di.get<LocationRepository>(),
        ),
      ],
      child: BlocSelector<SettingsCubit, SettingsState, UiSettings>(
        selector: (state) => state.uiSettings,
        builder: (context, uiSettings) {
          final router = Di.get<AppRouter>();

          return ThemeBuilder(
            builder: (lightTheme, darkTheme) => MaterialApp.router(
              scaffoldMessengerKey: SnackbarUtils.scaffoldMessangerKey,
              routerConfig: router.router,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: uiSettings.themeMode,
              locale: Locale(uiSettings.language.code),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({super.key, required this.builder});

  final Widget Function(
    ThemeData lightTheme,
    ThemeData darkTheme,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColors, darkColors) => builder(
        lightTheme(lightColors),
        darkTheme(darkColors),
      ),
    );
  }
}
