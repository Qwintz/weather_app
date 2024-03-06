// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      data: WeatherData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'location': instance.location,
      'data': instance.data,
    };
