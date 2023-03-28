import 'package:flutter/material.dart';

class FirstLog extends StatelessWidget {
  const FirstLog({super.key, required this.changePage});

  final Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => changePage(1),
          child: const Text('Connexion'),
        ),
        ElevatedButton(
          onPressed: () => changePage(2),
          child: const Text('Inscription'),
        ),
      ],
    );
  }
}