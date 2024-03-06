import '../../../common/services/geolocation_service.dart';
import '../api/location_api.dart';
import '../models/location.dart';

class LocationRepository {
  const LocationRepository(this._locationApi, this._geolocation);

  final LocationApi _locationApi;
  final GeolocationService _geolocation;

  Future<Location> determineLocation() async {
    final coords = await _geolocation.determineCoords();
    final jsons = await _locationApi.fetchLocationsByCoords(coords);

    return Location.fromJson(jsons.first);
  }

  Future<List<Location>> requestLocations(String query) async {
    final jsons = await _locationApi.fetchLocationsByName(query);

    return List<Location>.from(
      jsons.map((json) {
        return Location.fromJson(json);
      }),
    );
  }
}
