// lib/features/movement.dart
import 'package:sensors_plus/sensors_plus.dart';


Future<bool> isPhoneMoving() async {
  try {
    const Duration duration = Duration(seconds: 3);
    const double threshold = 0.2; // Define a suitable threshold for movement

    // Fetch accelerometer events for the specified duration
    Stream<AccelerometerEvent> eventStream = accelerometerEvents.timeout(duration, onTimeout: (sink) {
      sink.close();
    });

    List<AccelerometerEvent> events = await eventStream.toList();

    // Check if the phone is still by analyzing the accelerometer events
    for (var i = 1; i < events.length; i++) {
      if ((events[i].x - events[i - 1].x).abs() > threshold ||
          (events[i].y - events[i - 1].y).abs() > threshold ||
          (events[i].z - events[i - 1].z).abs() > threshold) {
        return true; // Movement detected
      }
    }
    return false; // No significant movement detected
  } catch (e) {
    print('Error in isPhoneMoving: $e');
    return false;
  }
}