import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/services/geolocation_service.dart';
import 'features/settings/cubit/settings_cubit.dart';
import 'features/settings/repositories/settings_repository.dart';
import 'features/weather/api/location_api.dart';
import 'features/weather/api/weather_api.dart';
import 'features/weather/cubit/weather_cubit.dart';
import 'features/weather/repositories/location_repository.dart';
import 'features/weather/repositories/weather_repository.dart';
import 'router/router.dart';
import 'utils/helpers/storage.dart';

class Di {
  static final _sl = GetIt.instance;

  static T get<T extends Object>() => _sl<T>();

  static Future<void> initDependencies() async {
    final preferences = await SharedPreferences.getInstance();

    _sl
      // Databases
      ..registerLazySingleton(() => Storage(preferences))

      // Routing
      ..registerLazySingleton(() => AppRouter(_sl()))

      // Networking
      ..registerFactory(() => Dio())

      // Apis
      ..registerLazySingleton(() => WeatherApi(_sl()))
      ..registerLazySingleton(() => LocationApi(_sl()))

      // Geolocation
      ..registerLazySingleton(() => GeolocatorPlatform.instance)
      ..registerLazySingleton(() => GeolocationService(_sl()))

      // Repositories
      ..registerLazySingleton(() => WeatherRepository(_sl(), _sl()))
      ..registerLazySingleton(() => LocationRepository(_sl(), _sl()))
      ..registerLazySingleton(() => SettingsRepository(_sl()))

      // Cubits
      ..registerFactory(() => WeatherCubit(_sl(), _sl()))
      ..registerFactory(() => SettingsCubit(_sl()));

    await _sl.allReady();
  }
}
