// lib/features/health.dart
import 'package:health/health.dart';

void getHealthData() async {
  try {
    HealthFactory health = HealthFactory();

    // Define the types of health data you want to read
    List<HealthDataType> types = [HealthDataType.STEPS];

    // Request access to the data
    bool accessWasGranted = await health.requestAuthorization(types);

    if (accessWasGranted) {
      // Fetch new data
      List<HealthDataPoint> data = await health.getHealthDataFromTypes(
        DateTime.now().subtract(Duration(days: 7)), DateTime.now(), types);

      // Print the data
      print('Printing health data...');
      if (data.isEmpty) {
        print('No health data available');
      } else {
        data.forEach((datum) => print(datum));
      }
    } else {
      print('Access to health data was not granted');
    }
  } catch (e) {
    print('Error in getHealthData: $e');
  }
}