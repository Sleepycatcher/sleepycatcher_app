import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final String text;

  Button2({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 250.0,
      decoration: BoxDecoration(
        color: const Color(0xff415fcd),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const[
          BoxShadow(
            color: const Color(0xff141e40),
            offset: Offset(5.0, 10.0),
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