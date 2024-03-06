import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/constants/enums.dart';
import '../models/forecast.dart';
import '../models/location.dart';
import '../repositories/location_repository.dart';
import '../repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepo, this._locationRepo)
      : super(const WeatherState.initial());

  final WeatherRepository _weatherRepo;
  final LocationRepository _locationRepo;

  Future<void> loadWeather() async {
    try {
      final forecasts = _weatherRepo.getForecasts();

      emit(state.copyWith(
        status: CubitStatus.success,
        forecasts: forecasts,
      ));
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> updateAllWeather() async {
    _onLoading();
    try {
      final forecasts = await Future.wait(
        state.forecasts.map((weather) {
          final location = weather.location;
          return _weatherRepo.requestForecast(location);
        }),
      );

      emit(state.copyWith(
        status: CubitStatus.success,
        forecasts: forecasts,
      ));

      await _weatherRepo.saveForecasts(forecasts);
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> addWeather(Location location) async {
    _onLoading();
    try {
      final weather = await _weatherRepo.requestForecast(location);

      late final List<Forecast> forecasts;
      if (state.locations.contains(location)) {
        final index = state.locations.indexOf(location);
        forecasts = List<Forecast>.from(state.forecasts)
          ..removeAt(index)
          ..insert(index, weather);
      } else {
        forecasts = List<Forecast>.from(state.forecasts)..insert(0, weather);
      }

      emit(state.copyWith(
        status: CubitStatus.success,
        forecasts: forecasts,
      ));

      await _weatherRepo.saveForecasts(forecasts);
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> addWeatherUsingGeolocation() async {
    _onLoading();
    try {
      final location = await _locationRepo.determineLocation();

      final weather = await _weatherRepo.requestForecast(location);

      late final List<Forecast> forecasts;
      if (state.locations.contains(location)) {
        final index = state.locations.indexOf(location);
        forecasts = List<Forecast>.from(state.forecasts)
          ..removeAt(index)
          ..insert(index, weather);
      } else {
        forecasts = List<Forecast>.from(state.forecasts)..insert(0, weather);
      }

      emit(state.copyWith(
        status: CubitStatus.success,
        forecasts: forecasts,
      ));

      await _weatherRepo.saveForecasts(forecasts);
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> updateWeather(int index) async {
    _onLoading();
    try {
      final location = state.forecasts[index].location;

      final weather = await _weatherRepo.requestForecast(location);
      final forecasts = List<Forecast>.from(state.forecasts)
        ..removeAt(index)
        ..insert(index, weather);

      emit(state.copyWith(
        status: CubitStatus.success,
        forecasts: forecasts,
      ));

      await _weatherRepo.saveForecasts(forecasts);
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> removeWeather(int index) async {
    _onLoading();
    try {
      final forecasts = List<Forecast>.from(state.forecasts)..removeAt(index);

      emit(state.copyWith(
        status: CubitStatus.success,
        forecasts: forecasts,
      ));

      await _weatherRepo.saveForecasts(forecasts);
    } catch (error) {
      _onError(error);
    }
  }

  Future<void> reorderWeather(int oldIndex, int newIndex) async {
    try {
      final weather = state.forecasts[oldIndex];
      final forecasts = List<Forecast>.from(state.forecasts)
        ..removeAt(oldIndex)
        ..insert(newIndex, weather);

      emit(state.copyWith(
        status: CubitStatus.success,
        forecasts: forecasts,
      ));

      await _weatherRepo.saveForecasts(forecasts);
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
