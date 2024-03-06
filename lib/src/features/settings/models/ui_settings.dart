import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/default.dart';
import '../../../utils/constants/enums.dart';

class UiSettings extends Equatable {
  const UiSettings({
    required this.themeMode,
    required this.language,
  });

  const UiSettings.initial()
      : themeMode = Default.defaultThemeMode,
        language = Default.defaultLanguage;

  final ThemeMode themeMode;
  final Language language;

  UiSettings copyWith({
    ThemeMode? themeMode,
    Language? language,
  }) =>
      UiSettings(
        themeMode: themeMode ?? this.themeMode,
        language: language ?? this.language,
      );

  @override
  List<Object?> get props => [
        themeMode,
        language,
      ];
}
