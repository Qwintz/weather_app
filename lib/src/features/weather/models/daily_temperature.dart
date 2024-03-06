import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_temperature.g.dart';

@JsonSerializable()
class DailyTemperature extends Equatable {
  const DailyTemperature({
    required this.min,
    required this.max,
  });

  @JsonKey(name: "min")
  final double min;

  @JsonKey(name: "max")
  final double max;

  factory DailyTemperature.fromJson(Map<String, dynamic> json) =>
      _$DailyTemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$DailyTemperatureToJson(this);

  @override
  List<Object?> get props => [
        min,
        max,
      ];
}
