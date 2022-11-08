import 'package:geolocator/geolocator.dart';

class LocationHelper {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);
    longitude = position.longitude;
    latitude = position.latitude;
    print(longitude);
    print(latitude);
  }
}
