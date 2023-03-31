import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Statistiques de la nuit du 30/03/2023',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),


        ],
      ),
    );
  }
}
