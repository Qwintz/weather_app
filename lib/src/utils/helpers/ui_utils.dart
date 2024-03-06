import 'package:flutter/material.dart';

import '../../features/weather/models/condition.dart';
import '../constants/assets.dart';
import '../constants/enums.dart';

abstract class UiUtils {
  static String getIcon(Condition condition, {bool isNight = false}) {
    return switch (condition) {
      Condition.thunderstormWithLightRain => Assets.thunderstormWithLightRain,
      Condition.thunderstormWithRain => Assets.thunderstormWithRain,
      Condition.thunderstormWithHeavyRain => Assets.thunderstormWithHeavyRain,
      Condition.lightThunderstorm => Assets.lightThunderstormNight,
      Condition.thunderstorm => Assets.thunderstorm,
      Condition.heavyThunderstorm => Assets.thunderstorm,
      Condition.raggedThunderstorm => Assets.thunderstorm,
      Condition.thunderstormWithLightDrizzle =>
        Assets.thunderstormWithLightRain,
      Condition.thunderstormWithDrizzle => Assets.thunderstormWithRain,
      Condition.thunderstormWithHeavyDrizzle =>
        Assets.thunderstormWithHeavyRain,
      Condition.lightIntensityDrizzle =>
        isNight ? Assets.lightRainNight : Assets.lightRain,
      Condition.drizzle => Assets.rain,
      Condition.heavyIntensityDrizzle => Assets.heavyRain,
      Condition.lightIntensityDrizzleRain =>
        isNight ? Assets.lightRainNight : Assets.lightRain,
      Condition.drizzleRain => Assets.rain,
      Condition.heavyIntensityDrizzleRain => Assets.heavyRain,
      Condition.showerRainAndDrizzle => Assets.rain,
      Condition.heavyShowerRainAndDrizzle => Assets.heavyRain,
      Condition.showerDrizzle => Assets.rain,
      Condition.lightRain => isNight ? Assets.lightRainNight : Assets.lightRain,
      Condition.moderateRain => Assets.rain,
      Condition.heavyIntensityRain => Assets.heavyRain,
      Condition.veryHeavyRain => Assets.extremeRain,
      Condition.extremeRain => Assets.extremeRain,
      Condition.freezingRain => Assets.freezingRain,
      Condition.lightIntensityShowerRain =>
        isNight ? Assets.lightRainNight : Assets.lightRain,
      Condition.showerRain => Assets.rain,
      Condition.heavyIntensityShowerRain => Assets.heavyRain,
      Condition.raggedShowerRain => Assets.heavyRain,
      Condition.lightSnow => isNight ? Assets.lightSnowNight : Assets.lightSnow,
      Condition.snow => Assets.snow,
      Condition.heavySnow => Assets.snow,
      Condition.sleet => Assets.hail,
      Condition.lightShowerSleet => Assets.hail,
      Condition.showerSleet => Assets.hail,
      Condition.lightRainAndSnow => Assets.freezingRain,
      Condition.rainAndSnow => Assets.freezingRain,
      Condition.lightShowerSnow =>
        isNight ? Assets.lightSnowNight : Assets.lightSnow,
      Condition.showerSnow => Assets.snow,
      Condition.heavyShowerSnow => Assets.snow,
      Condition.mist => Assets.fog,
      Condition.smoke => Assets.smoke,
      Condition.haze => isNight ? Assets.hazeNight : Assets.haze,
      Condition.sandDustWhirls => Assets.fog,
      Condition.fog => Assets.dust,
      Condition.sand => Assets.dust,
      Condition.dust => Assets.dust,
      Condition.volcanicAsh => Assets.dust,
      Condition.squalls => Assets.squall,
      Condition.tornado => Assets.tornado,
      Condition.clear => isNight ? Assets.clearNight : Assets.clear,
      Condition.fewClouds =>
        isNight ? Assets.partlyCloudyNight : Assets.partlyCloudy,
      Condition.scatteredClouds => Assets.mostlyCloudy,
      Condition.brokenClouds =>
        isNight ? Assets.partlyCloudyNight : Assets.partlyCloudy,
      Condition.overcastClouds => Assets.mostlyCloudy,
    };
  }

  static String getWeatherName(Condition condition) {
    return switch (condition) {
      Condition.thunderstormWithLightRain => "Condition",
      Condition.thunderstormWithRain => "Condition",
      Condition.thunderstormWithHeavyRain => "Condition",
      Condition.lightThunderstorm => "Condition",
      Condition.thunderstorm => "Condition",
      Condition.heavyThunderstorm => "Condition",
      Condition.raggedThunderstorm => "Condition",
      Condition.thunderstormWithLightDrizzle => "Condition",
      Condition.thunderstormWithDrizzle => "Condition",
      Condition.thunderstormWithHeavyDrizzle => "Condition",
      Condition.lightIntensityDrizzle => "Condition",
      Condition.drizzle => "Condition",
      Condition.heavyIntensityDrizzle => "Condition",
      Condition.lightIntensityDrizzleRain => "Condition",
      Condition.drizzleRain => "Condition",
      Condition.heavyIntensityDrizzleRain => "Condition",
      Condition.showerRainAndDrizzle => "Condition",
      Condition.heavyShowerRainAndDrizzle => "Condition",
      Condition.showerDrizzle => "Condition",
      Condition.lightRain => "Condition",
      Condition.moderateRain => "Condition",
      Condition.heavyIntensityRain => "Condition",
      Condition.veryHeavyRain => "Condition",
      Condition.extremeRain => "Condition",
      Condition.freezingRain => "Condition",
      Condition.lightIntensityShowerRain => "Condition",
      Condition.showerRain => "Condition",
      Condition.heavyIntensityShowerRain => "Condition",
      Condition.raggedShowerRain => "Condition",
      Condition.lightSnow => "Condition",
      Condition.snow => "Condition",
      Condition.heavySnow => "Condition",
      Condition.sleet => "Condition",
      Condition.lightShowerSleet => "Condition",
      Condition.showerSleet => "Condition",
      Condition.lightRainAndSnow => "Condition",
      Condition.rainAndSnow => "Condition",
      Condition.lightShowerSnow => "Condition",
      Condition.showerSnow => "Condition",
      Condition.heavyShowerSnow => "Condition",
      Condition.mist => "Condition",
      Condition.smoke => "Condition",
      Condition.haze => "Condition",
      Condition.sandDustWhirls => "Condition",
      Condition.fog => "Condition",
      Condition.sand => "Condition",
      Condition.dust => "Condition",
      Condition.volcanicAsh => "Condition",
      Condition.squalls => "Condition",
      Condition.tornado => "Condition",
      Condition.clear => "Condition",
      Condition.fewClouds => "Condition",
      Condition.scatteredClouds => "Condition",
      Condition.brokenClouds => "Condition",
      Condition.overcastClouds => "Condition",
    };
  }

  static String getThemeName(ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.system => "System",
      ThemeMode.light => "Light",
      ThemeMode.dark => "Dark",
    };
  }

  static String getLanguageName(Language language) {
    return switch (language) {
      Language.russian => "Русский",
      Language.english => "English",
    };
  }
}
