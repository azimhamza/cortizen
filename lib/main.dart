import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:protizen/features/screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

    print('Supabase client is working: ${response.data}');
  } catch (e) {
    print('Error testing Supabase client: $e');
  }
}
