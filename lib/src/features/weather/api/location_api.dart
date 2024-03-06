import 'package:dio/dio.dart';

import '../../../common/errors/api_exception.dart';
import '../../../common/errors/connection_exception.dart';
import '../../../utils/constants/api_constants.dart';

class LocationApi {
  LocationApi(this._dio) {
    _dio.options
      ..baseUrl = ApiConstants.locationApiUrl
      ..headers["x-placekit-api-key"] = ApiConstants.locationApiKey
      ..sendTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 3);
  }

  final Dio _dio;

  Future<List<dynamic>> fetchLocationsByName(String query) async {
    try {
      final response = await _dio.post(
        "/search",
        data: {
          "query": query,
          "types": [
            "city",
          ],
        },
      );

      return response.data!["results"] as List<dynamic>;
    } on DioException catch (error) {
      throw _getError(error);
    }
  }

  Future<List<dynamic>> fetchLocationsByCoords(String coords) async {
    try {
      final response = await _dio.post(
        "/reverse",
        data: {
          "coordinates": coords,
          "types": [
            "city",
          ],
        },
      );

      return response.data!["results"] as List<dynamic>;
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
