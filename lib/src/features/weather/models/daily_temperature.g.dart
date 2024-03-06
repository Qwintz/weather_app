// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTemperature _$DailyTemperatureFromJson(Map<String, dynamic> json) =>
    DailyTemperature(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$DailyTemperatureToJson(DailyTemperature instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };
