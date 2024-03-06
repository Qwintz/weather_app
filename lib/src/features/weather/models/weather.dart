import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utils/helpers/time_utils.dart';
import 'condition.dart';

abstract class Weather extends Equatable {
  const Weather({
    required this.time,
    required this.conditions,
  });

  @JsonKey(
    name: "dt",
    fromJson: TimeUtils.fromTimestamp,
    toJson: TimeUtils.toTimestamp,
  )
  final DateTime time;

  @JsonKey(
    name: "weather",
    fromJson: Condition.fromJson,
    toJson: Condition.toJson,
  )
  final List<Condition> conditions;

  @override
  List<Object?> get props => [
        time,
        conditions,
      ];
}
