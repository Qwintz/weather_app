import 'package:flutter/material.dart';

import '../../../utils/constants/default.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/storage.dart';

class SettingsRepository {
  const SettingsRepository(this._storage);

  final Storage _storage;

  ThemeMode getThemeMode() {
    final themeIndex = _storage.getThemeIndex();
    return themeIndex != null
        ? ThemeMode.values[themeIndex]
        : Default.defaultThemeMode;
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _storage.saveThemeIndex(themeMode.index);
  }

  Language getLanguage() {
    final languageIndex = _storage.getLanguageIndex();
    return languageIndex != null
        ? Language.values[languageIndex]
        : Default.defaultLanguage;
  }

  Future<void> saveLanguage(Language language) async {
    await _storage.saveLanguageIndex(language.index);
  }
}
