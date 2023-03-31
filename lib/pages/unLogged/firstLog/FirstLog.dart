import 'package:flutter/material.dart';

class FirstLog extends StatelessWidget {
  const FirstLog({Key? key, required this.changePage});

  final Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Bienvenue sur SleepCatcher !",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => changePage(1),
                  child: const Text('Connexion'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 24.0),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => changePage(2),
                  child: const Text('Inscription'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 24.0),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
