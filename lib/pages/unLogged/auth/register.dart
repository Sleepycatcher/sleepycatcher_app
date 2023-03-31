import 'package:flutter/material.dart';
import 'package:sleepycatcher/services/authService.dart';

import 'package:http/http.dart' as http;
import 'package:sleepycatcher/model/User.dart';
import 'dart:developer' as developer;



AuthService authService = AuthService();


bool isEmail(String em) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

bool isPasswordValid(String em) {
  String p = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$';
  RegExp regExp = RegExp(p);
  return !regExp.hasMatch(em);
}




class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.changePage});

  final Function(int) changePage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onTap() {
    widget.changePage(1); // Appelle la fonction changePage avec l'argument 1
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      child: Form(
        key: _formKey,
          child: Column(
            children: [
              const Text("Inscription",
              style: TextStyle(fontSize: 50)),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'email'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) return 'Vous devez renseigner un email';
                  if(!isEmail(value)) return 'Vous devez renseigner un email valide';
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "nom d'utilisateur"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) return 'Vous devez renseigner un nom d\'utilisateur';
                  if(value.length < 3) return 'Vous devez renseigner au moins 3 caractères';
                  if(value.length > 25) return 'Vous devez renseigner au plus 25 caractères'; /// TODO
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'mot de passe'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) return 'Vous devez renseigner un mot de passe';
                  if(value.length < 5) return 'Vous devez renseigner au moins 6 caractères';
                  if(value.length > 20) return '20 caractères maximum';
                  if(isPasswordValid(value)) return 'Pas le bon format'; // TODO
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'confirmation du mot de passe',
                ),
                validator: (value) {
                  if(value != _passwordController.text) return 'Les mots de passe ne correspondent pas';
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  developer.log('press buttom');
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Inscription en cours !')),
                    );
                    User user = User(
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    final response = await authService.register(user);
                    if(response != null) {
                        // si l'incription est valide
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response.body)),
                      );
                    } else {
                      // si l'incription non valide
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erreur veuillez réessayer')),
                      );
                    }
                  }
                },
                child: const Text('Inscription'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: Size(0.5 * MediaQuery.of(context).size.width, 24.0),
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: _onTap,
                child: const Text(
                  'Déjà un compte ?',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
          ]),
      ),
    );
  }
}
