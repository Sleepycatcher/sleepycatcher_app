import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton
            },
            child: Text('Rechercher des appareils Bluetooth'),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Le nombre de résultats à afficher
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Appareil $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
