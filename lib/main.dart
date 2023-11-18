import 'package:camera/camera.dart';

import 'package:protizen/features/screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/location.dart';
import 'features/movement.dart';
import 'features/health.dart';
import 'features/twilio.dart';
  
List<CameraDescription> cameras = [];


final supabase = Supabase.instance.client;


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // Initialize Supabase client
  Supabase.initialize(
    url: "https://dabhobujmqisrjhfzltz.supabase.co",
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhYmhvYnVqbXFpc3JqaGZ6bHR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzMzkwMDQsImV4cCI6MjAxNTkxNTAwNH0.JOlQSuThTF4Q593FUnA3vvMIf4b7O3lqdFPdSVpxego',
  );

  cameras = await availableCameras();

  runApp(const MyApp());
  testSupabaseClient();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

Future<void> testSupabaseClient() async {
  try {
    final response = await supabase
        .from('blood_pressure')
        .select()
        .limit(1)
        .execute();

    if (response != null) {
      throw response!;
    }
  void initState() {
    super.initState();
    print('initState is being called');
    getCurrentLocation();
    isPhoneMoving().then((isMoving) {
      print('isPhoneMoving completed');
      if (isMoving) {
        print('Phone is moving');
      } else {
        print('Phone is not moving');
      }
    }).catchError((error) {
      print('An error occurred: $error');
    });
    getHealthData();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    // sendTextMessage('+12898284206', '911 Emergency\n 123 Main St.\n San Francisco, CA 94103\n 37.7749° N, 122.4194° W\n Link for more details');
  }

    print('Supabase client is working: ${response.data}');
  } catch (e) {
    print('Error testing Supabase client: $e');
  }
}
