import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonEnum(alwaysCreate: true)
enum Condition {
  @JsonValue(200)
  thunderstormWithLightRain,

  @JsonValue(201)
  thunderstormWithRain,

  @JsonValue(202)
  thunderstormWithHeavyRain,

  @JsonValue(210)
  lightThunderstorm,

  @JsonValue(211)
  thunderstorm,

  @JsonValue(212)
  heavyThunderstorm,

  @JsonValue(221)
  raggedThunderstorm,

  @JsonValue(230)
  thunderstormWithLightDrizzle,

  @JsonValue(231)
  thunderstormWithDrizzle,

  @JsonValue(232)
  thunderstormWithHeavyDrizzle,

  @JsonValue(300)
  lightIntensityDrizzle,

  @JsonValue(301)
  drizzle,

  @JsonValue(302)
  heavyIntensityDrizzle,

  @JsonValue(310)
  lightIntensityDrizzleRain,

  @JsonValue(311)
  drizzleRain,

  @JsonValue(312)
  heavyIntensityDrizzleRain,

  @JsonValue(313)
  showerRainAndDrizzle,

  @JsonValue(314)
  heavyShowerRainAndDrizzle,

  @JsonValue(321)
  showerDrizzle,

  @JsonValue(500)
  lightRain,

  @JsonValue(501)
  moderateRain,

  @JsonValue(502)
  heavyIntensityRain,

  @JsonValue(503)
  veryHeavyRain,

  @JsonValue(504)
  extremeRain,

  @JsonValue(511)
  freezingRain,

  @JsonValue(520)
  lightIntensityShowerRain,

  @JsonValue(521)
  showerRain,

  @JsonValue(522)
  heavyIntensityShowerRain,

  @JsonValue(531)
  raggedShowerRain,

  @JsonValue(600)
  lightSnow,

  @JsonValue(601)
  snow,

  @JsonValue(602)
  heavySnow,

  @JsonValue(611)
  sleet,

  @JsonValue(612)
  lightShowerSleet,

  @JsonValue(613)
  showerSleet,

  @JsonValue(615)
  lightRainAndSnow,

  @JsonValue(616)
  rainAndSnow,

  @JsonValue(620)
  lightShowerSnow,

  @JsonValue(621)
  showerSnow,

  @JsonValue(622)
  heavyShowerSnow,

  @JsonValue(701)
  mist,

  @JsonValue(711)
  smoke,

  @JsonValue(721)
  haze,

  @JsonValue(731)
  sandDustWhirls,

  @JsonValue(741)
  fog,

  @JsonValue(751)
  sand,

  @JsonValue(761)
  dust,

  @JsonValue(762)
  volcanicAsh,

  @JsonValue(771)
  squalls,

  @JsonValue(781)
  tornado,

  @JsonValue(800)
  clear,

  @JsonValue(801)
  fewClouds,

  @JsonValue(802)
  scatteredClouds,

  @JsonValue(803)
  brokenClouds,

  @JsonValue(804)
  overcastClouds;

  static List<Condition> fromJson(List<dynamic> jsons) {
    return jsons.map((json) {
      return $enumDecode(_$ConditionEnumMap, json["id"]);
    }).toList();
  }

  static List<dynamic> toJson(List<Condition> conditions) {
    return conditions.map((condition) {
      return <String, dynamic>{
        'id': _$ConditionEnumMap[condition],
      };
    }).toList();
  }
}
