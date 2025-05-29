import 'package:flutter/material.dart';
import 'package:supabase_auth_flutter/auth/auth_service.dart';
import 'package:supabase_auth_flutter/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //auth service
  final authService = AuthService();

  //email n password controller s
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //login function
  void login() async {
    //get data
    final email = _emailController.text;
    final password = _passwordController.text;

    //login attempt
    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (err) {
      //catch if anyt error occurs
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: $err')));
      }
    }
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: login, child: Text('Login')),
          SizedBox(height: 20),
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                ),
            child: const Center(child: Text("Dont you have an acc? Register here!")),    
          ),
        ],
      ),
    );
  }
}
