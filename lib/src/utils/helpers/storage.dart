import 'package:shared_preferences/shared_preferences.dart';

import '../constants/storage_constants.dart';

class Storage {
  const Storage(this._preferences);

  final SharedPreferences _preferences;

  int? getThemeIndex() {
    return _preferences.getInt(StorageConstants.themePref);
  }

  Future<void> saveThemeIndex(int themeIndex) async {
    await _preferences.setInt(StorageConstants.themePref, themeIndex);
  }

  int? getLanguageIndex() {
    return _preferences.getInt(StorageConstants.languagePref);
  }

  Future<void> saveLanguageIndex(int languageIndex) async {
    await _preferences.setInt(StorageConstants.languagePref, languageIndex);
  }

  List<String>? getForecastStrings() {
    return _preferences.getStringList(StorageConstants.weatherPref);
  }

  Future<void> saveForecastStrings(List<String> strings) async {
    await _preferences.setStringList(StorageConstants.weatherPref, strings);
  }

  bool? getOnboadingFlag() {
    return _preferences.getBool(StorageConstants.onboadingPref);
  }

  Future<void> saveOnboardingFlag(bool flag) async {
    await _preferences.setBool(StorageConstants.onboadingPref, flag);
  }
}
