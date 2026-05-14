import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Latitude/longitude pair; `null` until a location is acquired.
typedef LocationState = ({double lat, double lon})?;

/// Manages location state.
class LocationNotifier extends Notifier<LocationState> {
  @override
  LocationState build() => null;
}
