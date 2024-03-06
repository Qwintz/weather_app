import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/ui_constants.dart';
import 'text_theme.dart';

final _defaultLightColors = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: UiConstants.defaultColor,
);

ThemeData lightTheme(ColorScheme? lightColors) {
  final colors = lightColors ?? _defaultLightColors;

  return ThemeData.from(
    useMaterial3: true,
    colorScheme: colors,
    textTheme: textTheme,
  ).copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: colors.background,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    searchViewTheme: const SearchViewThemeData(
      surfaceTintColor: Colors.transparent,
    ),
    snackBarTheme: SnackBarThemeData(
      showCloseIcon: true,
      backgroundColor: colors.error,
      closeIconColor: colors.onError,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      surfaceTintColor: Colors.transparent,
    ),
  );
}
