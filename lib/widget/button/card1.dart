import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String title;
  final String subtitle;


  Card1({
    required this.title,
    required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff000000),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            title: Text(
              title,
              textAlign:TextAlign.center,
            style: TextStyle(fontSize: 30)),
            subtitle: Text(
                subtitle,
              textAlign:TextAlign.center,
            ),
          ),
          const Divider(),
          Text('Contenu de la carte'),
        ],
      ),
    );
  }
}