import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/Sleep.dart';


Future<String?> getJWT() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('jwt');
}


Future<void> _getSleepCyclesData() async {
  String? jwt = await getJWT();

  final response = await http.get(
    Uri.parse('https://sleepycatcherapi.hop.sh/api/getAllStats'),
    headers: {"Authorization": "Scla $jwt"},
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    List<SleepCycle> sleepCyclesList = [];
    for (var cycle in jsonResponse) {
      //SleepCycle sleepCycle = SleepCycle.fromJson(cycle);
     // sleepCyclesList.add(sleepCycle);
    }

  } else {
    throw Exception('Failed to load sleep cycles data');
  }
}

