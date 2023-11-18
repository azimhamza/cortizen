import 'package:supabase_flutter/supabase_flutter.dart';


class SupabaseManager {
  static const String supabaseUrl = "https://dabhobujmqisrjhfzltz.supabase.co";
  static const String supabaseAnonKey =  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhYmhvYnVqbXFpc3JqaGZ6bHR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzMzkwMDQsImV4cCI6MjAxNTkxNTAwNH0.JOlQSuThTF4Q593FUnA3vvMIf4b7O3lqdFPdSVpxego';

 final SupabaseClient _client;

  SupabaseManager()
      : _client = SupabaseClient(supabaseUrl, supabaseAnonKey);
  SupabaseClient get client => _client;
}
