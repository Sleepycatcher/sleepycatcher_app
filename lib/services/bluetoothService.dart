import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  late BluetoothConnection? _connection;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  // Vérifie si le Bluetooth est activé sur l'appareil.
  Future<bool> isBluetoothEnabled() async {
    _bluetoothState = await FlutterBluetoothSerial.instance.state;
    return _bluetoothState == BluetoothState.STATE_ON;
  }

  // Recherche les appareils Bluetooth disponibles à proximité.
  Future<List<BluetoothDevice>> searchForDevices() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await FlutterBluetoothSerial.instance.getBondedDevices();
      devices += await FlutterBluetoothSerial.instance
          .startDiscovery()
          .where((result) => !devices.any((d) => d.address == result.device.address))
          .map((result) => result.device)
          .toList();

    } catch (ex) {
      print('Error searching for devices: $ex');
    }

    return devices;
  }

  // Connecte l'appareil Bluetooth avec l'adresse MAC donnée.
  Future<bool> connect(String macAddress) async {
    try {
      BluetoothDevice device;
      List<BluetoothDevice> devices = await FlutterBluetoothSerial.instance.getBondedDevices();
      device = devices.firstWhere((d) => d.address == macAddress);

      _connection = await BluetoothConnection.toAddress(device.address);
      return true;
    } catch (ex) {
      print('Error connecting to device: $ex');
      return false;
    }
  }


  // Déconnecte l'appareil Bluetooth actuellement connecté.
  Future<void> disconnect() async {
    if (_connection != null) {
      _connection!.dispose();
      _connection = null;
    }
  }



}
