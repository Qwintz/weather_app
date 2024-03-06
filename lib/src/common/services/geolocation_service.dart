import 'package:geolocator/geolocator.dart';

class GeolocationService {
  const GeolocationService(this._geolocator);

  final GeolocatorPlatform _geolocator;

  Future<String> determineCoords() async {
    final isServiceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      throw const GeolocationException();
    }

    final hasPermission = await _checkPermission();
    if (!hasPermission) {
      throw const GeolocationException();
    }

    final position = await _geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );

    return "${position.latitude}, ${position.longitude}";
  }

  Future<bool> _checkPermission() async {
    LocationPermission permission = await _geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) return true;

    permission = await _geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) return true;

    return false;
  }

  Future<void> openGeolocationSettings() async {
    await _geolocator.openAppSettings();
  }
}

class GeolocationException implements Exception {
  const GeolocationException();
}
