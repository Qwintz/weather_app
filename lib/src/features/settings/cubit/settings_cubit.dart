import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../models/ui_settings.dart';
import '../repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._settingsRepo) : super(const SettingsState.initial());

  final SettingsRepository _settingsRepo;

  void loadSettings() {
    try {
      final themeMode = _settingsRepo.getThemeMode();
      final language = _settingsRepo.getLanguage();

      emit(state.copyWith(
        status: CubitStatus.success,
        uiSettings: UiSettings(
          themeMode: themeMode,
          language: language,
        ),
      ));
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    _onLoading();
    try {
      await _settingsRepo.saveThemeMode(themeMode);

      emit(state.copyWith(
        status: CubitStatus.success,
        uiSettings: state.uiSettings.copyWith(
          themeMode: themeMode,
        ),
      ));
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> changeLanguage(Language language) async {
    _onLoading();
    try {
      await _settingsRepo.saveLanguage(language);

      emit(state.copyWith(
        status: CubitStatus.success,
        uiSettings: state.uiSettings.copyWith(
          language: language,
        ),
      ));
    } catch (error) {
      _onError(error);
    }
  }

  void _onLoading() {
    emit(state.copyWith(
      status: CubitStatus.loading,
    ));
  }

  void _onError(Object error) {
    emit(state.copyWith(
      status: CubitStatus.error,
      error: error,
    ));
  }
}
