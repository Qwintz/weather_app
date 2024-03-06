// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String,
      region: json['administrative'] as String,
      country: json['country'] as String,
      coords: json['coordinates'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'administrative': instance.region,
      'country': instance.country,
      'coordinates': instance.coords,
    };
