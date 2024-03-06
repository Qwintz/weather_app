// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) => DailyWeather(
      time: TimeUtils.fromTimestamp(json['dt'] as int),
      conditions: Condition.fromJson(json['weather'] as List),
      temp: DailyTemperature.fromJson(json['temp'] as Map<String, dynamic>),
      precip: (json['pop'] as num).toDouble(),
      sunrise: TimeUtils.fromTimestamp(json['sunrise'] as int),
      sunset: TimeUtils.fromTimestamp(json['sunset'] as int),
    );

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'dt': TimeUtils.toTimestamp(instance.time),
      'weather': Condition.toJson(instance.conditions),
      'sunrise': TimeUtils.toTimestamp(instance.sunrise),
      'sunset': TimeUtils.toTimestamp(instance.sunset),
      'temp': instance.temp,
      'pop': instance.precip,
    };
