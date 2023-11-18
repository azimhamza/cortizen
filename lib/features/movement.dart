// lib/features/movement.dart
import 'package:sensors_plus/sensors_plus.dart';


Future<bool> isPhoneMoving() async {
  const int numberOfEvents = 10;
  const double threshold = 0.2; // Define a suitable threshold for movement

  // Fetch a list of accelerometer events
  List<AccelerometerEvent> events = await accelerometerEvents.take(numberOfEvents).toList();

  // Check if the phone is still by analyzing the accelerometer events
  for (var i = 1; i < events.length; i++) {
    if ((events[i].x - events[i - 1].x).abs() > threshold ||
        (events[i].y - events[i - 1].y).abs() > threshold ||
        (events[i].z - events[i - 1].z).abs() > threshold) {
      print('Movement detected')
      return true; // Movement detected
    }
  }
  print('No movement detected')
  return false; // No significant movement detected
}