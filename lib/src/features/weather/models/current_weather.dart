import 'package:json_annotation/json_annotation.dart';

import '../../../utils/helpers/time_utils.dart';
import 'condition.dart';
import 'weather.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather extends Weather {
  const CurrentWeather({
    required super.time,
    required super.conditions,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.wind,
    required this.uvIndex,
    required this.sunrise,
    required this.sunset,
  });

  @JsonKey(name: "temp")
  final double temp;

  @JsonKey(name: "feels_like")
  final double feelsLike;

  @JsonKey(name: "humidity")
  final int humidity;

  @JsonKey(name: "pressure")
  final int pressure;

  @JsonKey(name: "wind_speed")
  final double wind;

  @JsonKey(name: "uvi")
  final double uvIndex;

  @JsonKey(
    name: "sunrise",
    fromJson: TimeUtils.fromTimestamp,
    toJson: TimeUtils.toTimestamp,
  )
  final DateTime sunrise;

  @JsonKey(
    name: "sunset",
    fromJson: TimeUtils.fromTimestamp,
    toJson: TimeUtils.toTimestamp,
  )
  final DateTime sunset;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);

  @override
  List<Object?> get props => super.props
    ..addAll([
      temp,
      feelsLike,
      humidity,
      pressure,
      wind,
      uvIndex,
      sunrise,
      sunset,
    ]);
}
