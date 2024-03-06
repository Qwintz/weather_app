import 'package:dio/dio.dart';

import '../../../common/errors/api_exception.dart';
import '../../../common/errors/connection_exception.dart';
import '../../../utils/constants/api_constants.dart';

class WeatherApi {
  WeatherApi(this._dio) {
    _dio.options
      ..baseUrl = ApiConstants.weatherApiUrl
      ..queryParameters["appid"] = ApiConstants.weatherApiKey
      ..sendTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 3);
  }

  final Dio _dio;

  Future<Map<String, dynamic>> fetchWeather(String coords) async {
    try {
      final [lat, lon] = coords.split(", ");
      final response = await _dio.get<Map<String, dynamic>>(
        "/data/3.0/onecall",
        queryParameters: {
          "lat": lat,
          "lon": lon,
          "units": "metric",
          "exclude": [
            "minutely",
            "alerts",
          ],
        },
      );

      return response.data!;
    } on DioException catch (error) {
      throw _getError(error);
    }
  }

  Exception _getError(DioException error) {
    if (error.type == DioExceptionType.connectionError) {
      return const ConnectionException();
    }

    return const ApiException();
  }
}
