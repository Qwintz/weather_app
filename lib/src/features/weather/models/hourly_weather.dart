import 'package:json_annotation/json_annotation.dart';

import '../../../utils/helpers/time_utils.dart';
import 'condition.dart';
import 'weather.dart';

part 'hourly_weather.g.dart';

@JsonSerializable()
class HourlyWeather extends Weather {
  const HourlyWeather({
    required super.time,
    required super.conditions,
    required this.temp,
    required this.precip,
  });

  @JsonKey(name: "temp")
  final double temp;

  @JsonKey(name: "pop")
  final double precip;

  factory HourlyWeather.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherToJson(this);

  HourlyWeather copyWith({
    DateTime? time,
    List<Condition>? conditions,
    double? temp,
    double? precip,
  }) =>
      HourlyWeather(
        time: time ?? this.time,
        conditions: conditions ?? this.conditions,
        temp: temp ?? this.temp,
        precip: precip ?? this.precip,
      );

  @override
  List<Object?> get props => super.props
    ..addAll([
      temp,
      precip,
    ]);
}
