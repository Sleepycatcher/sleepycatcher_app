import 'package:flutter/material.dart';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../services/bluetoothService.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final BluetoothService _bluetoothService = BluetoothService();

  List<BluetoothDevice> _devices = [];

  Future<void> _getDevices() async {
    final List<BluetoothDevice> devices = await _bluetoothService.searchForDevices();
    setState(() {
      _devices = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _getDevices();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeviceListView(devices: _devices),
            ),
          );
        },
        child: const Text('Rechercher les appareils Bluetooth'),
      ),
    );
  }
}

class DeviceListView extends StatelessWidget {
  const DeviceListView({Key? key, required this.devices}) : super(key: key);

  final List<BluetoothDevice> devices;

  Future<void> _connectToDevice(BuildContext context, String macAddress) async {
    bool isConnected = await BluetoothService().connect(macAddress);
    if (isConnected) {
      Navigator.pop(context, macAddress);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La connexion à réussi !'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La connexion à l\'appareil a échoué.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appareils Bluetooth'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (BuildContext context, int index) {
          final BluetoothDevice device = devices[index];
          return ListTile(
            title: Text(device.name ?? 'NOM INCONNU'),
            subtitle: Text(device.address),
            onTap: () {
              _connectToDevice(context, device.address);
            },
          );
        },
      ),
    );
  }
}
