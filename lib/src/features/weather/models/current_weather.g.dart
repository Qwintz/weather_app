// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      time: TimeUtils.fromTimestamp(json['dt'] as int),
      conditions: Condition.fromJson(json['weather'] as List),
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      humidity: json['humidity'] as int,
      pressure: json['pressure'] as int,
      wind: (json['wind_speed'] as num).toDouble(),
      uvIndex: (json['uvi'] as num).toDouble(),
      sunrise: TimeUtils.fromTimestamp(json['sunrise'] as int),
      sunset: TimeUtils.fromTimestamp(json['sunset'] as int),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'dt': TimeUtils.toTimestamp(instance.time),
      'weather': Condition.toJson(instance.conditions),
      'sunrise': TimeUtils.toTimestamp(instance.sunrise),
      'sunset': TimeUtils.toTimestamp(instance.sunset),
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'wind_speed': instance.wind,
      'uvi': instance.uvIndex,
    };
