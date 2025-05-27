// import 'dart:io';

// import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

// class PrinterServices {
//   PrinterServices() {
//     initPlatformState();
//   }
//   String _info = "";
//   String _msj = '';
//   bool connected = false;
//   List<BluetoothInfo> items = [];
//   final String _selectSize = "2";
//   bool _progress = false;
//   String _msjprogress = "";
//   String optionprinttype = "58 mm";
//   List<String> options = ["58 mm", "80 mm"];

//   Future<void> initPlatformState() async {
//     String platformVersion;
//     int porcentbatery = 0;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await PrintBluetoothThermal.platformVersion;
//       //print("patformversion: $platformVersion");
//       porcentbatery = await PrintBluetoothThermal.batteryLevel;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     final bool result = await PrintBluetoothThermal.bluetoothEnabled;
//     print("bluetooth enabled: $result");
//     if (result) {
//       _msj = "Bluetooth enabled, please search and connect";
//     } else {
//       _msj = "Bluetooth not enabled";
//     }

//     setState(() {
//       _info = "$platformVersion ($porcentbatery% battery)";
//     });
//   }

//   Future<void> getBluetoots() async {
//     setState(() {
//       _progress = true;
//       _msjprogress = "Wait";
//       items = [];
//     });
//     final List<BluetoothInfo> listResult =
//         await PrintBluetoothThermal.pairedBluetooths;

//     /*await Future.forEach(listResult, (BluetoothInfo bluetooth) {
//       String name = bluetooth.name;
//       String mac = bluetooth.macAdress;
//     });*/

//     setState(() {
//       _progress = false;
//     });

//     if (listResult.isEmpty) {
//       _msj =
//           "There are no bluetoohs linked, go to settings and link the printer";
//     } else {
//       _msj = "Touch an item in the list to connect";
//     }

//     setState(() {
//       items = listResult;
//     });
//   }

//    Future<void> connect(String mac) async {
//     setState(() {
//       _progress = true;
//       _msjprogress = "Connecting...";
//       connected = false;
//     });
//     final bool result =
//         await PrintBluetoothThermal.connect(macPrinterAddress: mac);
//     print("state conected $result");
//     if (result) connected = true;
//     setState(() {
//       _progress = false;
//     });
//   }

//  Future<void> disconnect() async {
//     final bool status = await PrintBluetoothThermal.disconnect;
//     setState(() {
//       connected = false;
//     });
//     print("status disconnect $status");
//   }

//   Future<void> printTest() async {
//     /*if (kDebugMode) {
//       bool result = await PrintBluetoothThermalWindows.writeBytes(bytes: "Hello \n".codeUnits);
//       return;
//     }*/

//     bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
//     if (conexionStatus) {
//       bool result = false;
//       if (Platform.isWindows) {
//         List<int> ticket = await testWindows();
//         result = await PrintBluetoothThermalWindows.writeBytes(bytes: ticket);
//       } else {
//         List<int> ticket = await testTicket();
//         result = await PrintBluetoothThermal.writeBytes(ticket);
//       }
//       print("print test result:  $result");
//     } else {
//       print("print test conexionStatus: $conexionStatus");
//       setState(() {
//         disconnect();
//       });
//       //throw Exception("Not device connected");
//     }
//   }

// }
