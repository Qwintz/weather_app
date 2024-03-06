part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  const WeatherState({
    required this.status,
    required this.forecasts,
    this.error,
  });

  const WeatherState.initial()
      : status = CubitStatus.initial,
        forecasts = const [],
        error = null;

  final CubitStatus status;
  final List<Forecast> forecasts;
  final Object? error;

  bool get hasError => error != null;

  List<Location> get locations {
    return List<Location>.from(
      forecasts.map((weather) {
        return weather.location;
      }),
    );
  }

  WeatherState copyWith({
    CubitStatus? status,
    List<Forecast>? forecasts,
    Object? error,
  }) =>
      WeatherState(
        status: status ?? this.status,
        forecasts: forecasts ?? this.forecasts,
        error: error,
      );

  @override
  List<Object?> get props => [
        status,
        forecasts,
        error,
      ];
}
