/* 

listen for auth state changes

unauth -> login
auth -> home

*/

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        //listen auth state changes
        stream: Supabase.instance.client.auth.onAuthStateChange, 

        //build page based on auth state
        builder: (context ,snapshot){
            //if its loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            //if there is a valid session
            final session = snapshot.hasData ? snapshot.data!.session : null;

            if(session != null) {
              //if user is authenticated, go to home page
              return const HomePage();
            } else {
              //if user isnt authenticated, go to login page
              return const LoginPage();
            }
        }
    );
  }
}