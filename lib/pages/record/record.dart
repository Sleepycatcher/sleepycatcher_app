import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  _SleepRecorderPageState createState() => _SleepRecorderPageState();
}

class _SleepRecorderPageState extends State<RecordPage> {
  bool _isRecording = false;
  bool _isAlarmSet = false;
  TimeOfDay? _alarmTime;


  static const alarmAudioPath = 'alarm.mp3';

  void _startRecording() {
    setState(() {
      _isRecording = true;
    });
    _showSnackBar('Enregistrement en cours...');
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
    _showSnackBar('Enregistrement terminé.');
  }

  void _setAlarmTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _isAlarmSet = true;
        _alarmTime = pickedTime;
      });
      _showSnackBar('Réveil programmé à ${_formatTime(_alarmTime!)}');
    }
  }

  void _cancelAlarm() {
    setState(() {
      _isAlarmSet = false;
      _alarmTime = null;
    });
    _showSnackBar('Réveil annulé.');
  }



  void _stopAlarm() async {

    _showSnackBar('Réveil arrêté.');
  }

  String _formatTime(TimeOfDay time) {
    final now = new DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm').format(dateTime);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Suivi du Sommeil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'Arrêter l\'enregistrement' : 'Commencer l\'enregistrement'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isAlarmSet ? _cancelAlarm : _setAlarmTime,
              child: Text(_isAlarmSet ? 'Annuler le réveil' : 'Programmer un réveil'),
            ),
            if (_isAlarmSet) SizedBox(height: 10),
            if (_isAlarmSet) Text('Réveil programmé à ${_formatTime(_alarmTime!)}'),
            SizedBox(height: 20),

          ],

      );

  }
}
