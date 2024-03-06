import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable {
  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.coords,
  });

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "administrative")
  final String region;

  @JsonKey(name: "country")
  final String country;

  @JsonKey(name: "coordinates")
  final String coords;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [
        name,
        region,
        country,
        coords,
      ];
}
