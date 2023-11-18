import 'package:supabase_flutter/supabase_flutter.dart';


class SupabaseManager {
  static const String supabaseUrl = "https://zhdyeywmfhdswaamaobi.supabase.co";
  static const String supabaseAnonKey =  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpoZHlleXdtZmhkc3dhYW1hb2JpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzMjc0MTcsImV4cCI6MjAxNTkwMzQxN30.Fm85k7m6jKxzASTM5URDYrlaGjIAbBA9uRDRIw089x4';

 final SupabaseClient _client;

  SupabaseManager()
      : _client = SupabaseClient(supabaseUrl, supabaseAnonKey);
  SupabaseClient get client => _client;
}
