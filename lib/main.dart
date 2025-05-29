import 'package:flutter/material.dart';
import 'package:supabase_auth_flutter/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
    url: 'https://wvwdeavcqxjlknizgxia.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind2d2RlYXZjcXhqbGtuaXpneGlhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgzNDQ5NTMsImV4cCI6MjA2MzkyMDk1M30.jicqcPEnN8osHjqU694vHWCE-saIaHmgi063HtBHzRk',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}


