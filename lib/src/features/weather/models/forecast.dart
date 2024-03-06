import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'weather_data.dart';

export 'weather_data.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast extends Equatable {
  const Forecast({
    required this.location,
    required this.data,
  });

  @JsonKey(name: "location")
  final Location location;

  @JsonKey(name: "data")
  final WeatherData data;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  @override
  List<Object?> get props => [
        location,
        data,
      ];
}
