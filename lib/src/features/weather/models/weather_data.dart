import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'current_weather.dart';
import 'daily_weather.dart';
import 'hourly_weather.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData extends Equatable {
  const WeatherData({
    required this.current,
    required this.hourly,
    required this.daily,
  });

  @JsonKey(name: "current")
  final CurrentWeather current;

  @JsonKey(name: "hourly")
  final List<HourlyWeather> hourly;

  @JsonKey(name: "daily")
  final List<DailyWeather> daily;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

  @override
  List<Object?> get props => [
        current,
        hourly,
        daily,
      ];
}
