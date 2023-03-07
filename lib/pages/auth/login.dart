import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sleepycatcher/pages/auth/register.dart';
import '../../model/User.dart';
import 'dart:developer' as developer;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                developer.log('press buttom');
                if (_formKey.currentState!.validate()) {
                  // Submit form
                  // Call your authentication API here
                  User user = User(
                    username:  _emailController.text,
                    email:  _emailController.text,
                    password: _passwordController.text,
                  );
                 // http.Response response = login(user) as http.Response;

                  final response = await authService.login(user);
                  if(response != null) {
                    // si l'incription est valide
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response.body)),
                      // enregistrement du JWT dans l'app
                    );
                  } else {
                    // si l'incription non valide
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erreur veuillez réessayer')),
                    );
                  }
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );

  }
}