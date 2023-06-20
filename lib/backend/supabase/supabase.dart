import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://dbqafffwgldsbgtbqvhq.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRicWFmZmZ3Z2xkc2JndGJxdmhxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODcyNzE5NTEsImV4cCI6MjAwMjg0Nzk1MX0.P7dpaEsWiqhEGfHUmhWhHIXwt72i-Y-vwK2H8oXvmNY';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
