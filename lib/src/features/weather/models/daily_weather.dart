import 'package:json_annotation/json_annotation.dart';

import '../../../utils/helpers/time_utils.dart';
import 'condition.dart';
import 'daily_temperature.dart';
import 'weather.dart';

part 'daily_weather.g.dart';

@JsonSerializable()
class DailyWeather extends Weather {
  const DailyWeather({
    required super.time,
    required super.conditions,
    required this.temp,
    required this.precip,
    required this.sunrise,
    required this.sunset,
  });

  @JsonKey(name: "temp")
  final DailyTemperature temp;

  @JsonKey(name: "pop")
  final double precip;

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

  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);

  @override
  List<Object?> get props => super.props
    ..addAll([
      temp,
      precip,
      sunrise,
      sunset,
    ]);
}
