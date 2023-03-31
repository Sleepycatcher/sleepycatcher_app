import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/bluetoothService.dart';
import './commonInfo.dart';

Future<void> saveConnectedDevice(String address) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('connected_device_address', address);
}

Future<void> disconnectAndRemoveDevice() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('connected_device_address');
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  final _bluetoothService = BluetoothService();
  bool _isDeviceConnected = true;
  List<BluetoothDevice> _devices = [];

  @override
  void initState() {
    super.initState();
    _checkConnectedDevice();
  }

  Future<void> _checkConnectedDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final connectedDeviceAddress = prefs.getString('connected_device_address');
    if (connectedDeviceAddress != null) {
      setState(() {
        _isDeviceConnected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: const [
              Text('name'),
              Text('email'),
            ],
          ),
        ),
        Container(
          child: ElevatedButton(
            onPressed: () {
              _bluetoothService.searchForDevices().then((devices) {
                setState(() {
                  _devices = devices;
                });
                for (BluetoothDevice device in devices) {
                  print('Device found: ${device.name} (${device.address})');
                }
              });
            },
            child: const Text('Rechercher les appareils Bluetooth'),
          ),
        ),
        if (_isDeviceConnected)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Appareil Bluetooth connecté !'),
                  ElevatedButton(
                    onPressed: () async {
                      await _bluetoothService.disconnect();
                      setState(() {
                        _isDeviceConnected = false;
                      });
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove('connected_device_address');
                    },
                    child: const Text('Déconnecter'),
                  ),
                ],
              ),
            ),
          ),
        if (!_isDeviceConnected)
          Expanded(
            child: ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (BuildContext context, int index) {
                final device = _devices[index];
                return ListTile(
                  title: Text(device.name ?? 'pas de nom'),
                  subtitle: Text(device.address),
                  onTap: () async {
                    bool isConnected = await _bluetoothService.connect(device.address);
                    if (isConnected) {
                      print("connection success !");
                      setState(() {
                        _isDeviceConnected = true;
                      });
                      await saveConnectedDevice(device.address);
                    } else {
                      print("connection failed !");
                      _isDeviceConnected = true; // test
                    }
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
