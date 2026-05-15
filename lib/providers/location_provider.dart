import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

/// Latitude/longitude pair; `null` until a location is acquired.
typedef LocationState = ({double lat, double lon})?;

/// Manages location state.
class LocationNotifier extends Notifier<LocationState> {
  @override
  LocationState build() => null;

  /// Requests GPS permission then acquires the current position.
  Future<void> fetchGps() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      throw const PermissionDeniedException(
        'Location permission denied.',
      );
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
      ),
    );

    state = (lat: position.latitude, lon: position.longitude);
  }
}
