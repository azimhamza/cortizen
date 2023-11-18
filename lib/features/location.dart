// lib/features/location.dart
import 'package:geolocator/geolocator.dart';

void getCurrentLocation() async {
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.deniedForever) {
    // Handle the case where permission is permanently denied.
    return;
  }
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      return;
    }
  }
  Position position = await Geolocator.getCurrentPosition();
  print('Current position is ${position.latitude}, ${position.longitude}');
}