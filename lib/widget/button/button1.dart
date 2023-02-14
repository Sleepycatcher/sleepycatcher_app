import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final String text;

  Button1({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 200.0,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xffb77fff), Color(0xff6F28C9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}