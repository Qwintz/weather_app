part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.status,
    required this.uiSettings,
    this.error,
  });

  const SettingsState.initial()
      : status = CubitStatus.initial,
        uiSettings = const UiSettings.initial(),
        error = null;

  final CubitStatus status;
  final UiSettings uiSettings;
  final Object? error;

  bool get hasError => error != null;

  SettingsState copyWith({
    CubitStatus? status,
    UiSettings? uiSettings,
    Object? error,
  }) =>
      SettingsState(
        status: status ?? this.status,
        uiSettings: uiSettings ?? this.uiSettings,
        error: error,
      );

  @override
  List<Object?> get props => [
        status,
        uiSettings,
        error,
      ];
}
