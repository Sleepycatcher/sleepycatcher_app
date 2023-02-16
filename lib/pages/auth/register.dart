import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'email'
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "nom d'utilisateur"
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'mot de passe'
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'confirmation du mot de passe'
                ),
              ),
            ],
          )
      ),
    );
  }
}
