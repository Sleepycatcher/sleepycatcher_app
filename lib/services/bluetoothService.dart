import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  late BluetoothConnection? _connection;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  get isConnected => null;

  // Vérifie si le Bluetooth est activé sur l'appareil.
  Future<bool> isBluetoothEnabled() async {
    _bluetoothState = await FlutterBluetoothSerial.instance.state;
    return _bluetoothState == BluetoothState.STATE_ON;
  }

  Future<List<BluetoothDevice>> searchForDevices() async {
    final List<BluetoothDevice> devices = [];

    try {
      final List<BluetoothDevice> bondedDevices =
      await FlutterBluetoothSerial.instance.getBondedDevices();
      devices.addAll(bondedDevices);

      final Stream<BluetoothDiscoveryResult> discoveryStream =
      FlutterBluetoothSerial.instance.startDiscovery();
      discoveryStream.listen((discoveryResult) {
        if (!devices.contains(discoveryResult.device)) {
          devices.add(discoveryResult.device);
        }
      });
    } catch (ex) {
      print('Error searching for devices: $ex');
    }

    print("device result");
    devices.forEach((device) {
      print(device.name);
      print(device.address);
    });
    print("device result end");
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
