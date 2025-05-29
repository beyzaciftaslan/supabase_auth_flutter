import 'package:flutter/material.dart';
import 'package:supabase_auth_flutter/auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final authService = AuthService();

  //when logout btn pressed 
  void logout() async {
    await authService.signOut();
  }

  //UI
  @override
  Widget build(BuildContext context) { 

    //get suer data
    final currentEmail = authService.getCurrentUserEmail();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: logout),
        ],
      ),
      body: Center(
        child: Text("Logged in as: $currentEmail"),
      ),
    );
  }
}
