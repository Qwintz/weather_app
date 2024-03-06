import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/ui_constants.dart';
import 'text_theme.dart';

final _defaultDarkColors = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: UiConstants.defaultColor,
);

ThemeData darkTheme(ColorScheme? darkColors) {
  final colors = darkColors ?? _defaultDarkColors;

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
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: colors.background,
        systemNavigationBarIconBrightness: Brightness.light,
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
