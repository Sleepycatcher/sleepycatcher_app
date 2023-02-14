import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String text;

  Card1({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff000000),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('Titre de la carte'),
            subtitle: Text('Sous-titre de la carte'),
          ),
          const Divider(),
          Text('Contenu de la carte'),
        ],
      ),
    );
  }
}