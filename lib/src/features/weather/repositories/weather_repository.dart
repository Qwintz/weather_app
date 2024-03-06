import 'dart:convert';

import '../../../utils/helpers/storage.dart';
import '../api/weather_api.dart';
import '../models/forecast.dart';
import '../models/location.dart';

class WeatherRepository {
  const WeatherRepository(
    this._weatherApi,
    this._storage,
  );

  final WeatherApi _weatherApi;
  final Storage _storage;

  Future<Forecast> requestForecast(Location location) async {
    final json = await _weatherApi.fetchWeather(location.coords);
    final data = WeatherData.fromJson(json);

    return Forecast(
      location: location,
      data: data,
    );
  }

  List<Forecast> getForecasts() {
    final strings = _storage.getForecastStrings() ?? [];

    final forecasts = List<Forecast>.from(
      strings.map((string) {
        final json = jsonDecode(string) as Map<String, dynamic>;
        return Forecast.fromJson(json);
      }),
    );

    return forecasts;
  }

  Future<void> saveForecasts(List<Forecast> forecasts) async {
    final strings = List<String>.from(
      forecasts.map((forecast) {
        final json = forecast.toJson();
        return jsonEncode(json);
      }),
    );

    await _storage.saveForecastStrings(strings);
  }
}
