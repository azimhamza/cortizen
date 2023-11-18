import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:protizen/features/screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

List<CameraDescription> cameras = [];



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // Initialize Supabase client
  Supabase.initialize(
    url: "https://zhdyeywmfhdswaamaobi.supabase.co",
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpoZHlleXdtZmhkc3dhYW1hb2JpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzMjc0MTcsImV4cCI6MjAxNTkwMzQxN30.Fm85k7m6jKxzASTM5URDYrlaGjIAbBA9uRDRIw089x4',
  );
  
  cameras = await availableCameras();

  runApp(const MyApp());
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
