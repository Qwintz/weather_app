// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeather _$HourlyWeatherFromJson(Map<String, dynamic> json) =>
    HourlyWeather(
      time: TimeUtils.fromTimestamp(json['dt'] as int),
      conditions: Condition.fromJson(json['weather'] as List),
      temp: (json['temp'] as num).toDouble(),
      precip: (json['pop'] as num).toDouble(),
    );

Map<String, dynamic> _$HourlyWeatherToJson(HourlyWeather instance) =>
    <String, dynamic>{
      'dt': TimeUtils.toTimestamp(instance.time),
      'weather': Condition.toJson(instance.conditions),
      'temp': instance.temp,
      'pop': instance.precip,
    };
