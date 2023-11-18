import 'package:supabase/supabase.dart';

class SupabaseService {
  final SupabaseClient client;

  SupabaseService()
      : client = SupabaseClient('https://dabhobujmqisrjhfzltz.supabase.co', 
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhYmhvYnVqbXFpc3JqaGZ6bHR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzMzkwMDQsImV4cCI6MjAxNTkxNTAwNH0.JOlQSuThTF4Q593FUnA3vvMIf4b7O3lqdFPdSVpxego');

  Future<void> sendData(Map<String, dynamic> data) async {
    final response = await client.from('incidents').insert(data).execute();

    if (response.error != null) {
      throw Exception('Failed to send data: ${response.error!.message}');
    }
  }
}