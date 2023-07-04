import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  static const MethodChannel _channel = MethodChannel('adb_disable_app');
  final MethodChannel _channel1 = MethodChannel('adb_disable_app1');
//!
  static Future<void> disableUSBFileTransfer() async {
    try {
      await _channel.invokeMethod('disableUSBFileTransfer');
    } catch (e) {
      print('Failed to disable USB file transfer: $e');
    }
  }

//!
  void enableUSBFileTransfer() async {
    try {
      await MethodChannel('adb_disable_app')
          .invokeMethod('enableUSBFileTransfer');
      print('USB file transfer enabled successfully.');
    } catch (e) {
      print('Failed to enable USB file transfer: $e');
    }
  }

//!
  Future<void> disableFileTransfer() async {
    try {
      await _channel1.invokeMethod('disableFileTransfer');
      print('File transfer disabled.');
    } catch (e) {
      print('Failed to disable file transfer: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADB Disabler"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  enableUSBFileTransfer();
                },
                child: Text("Enable")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  disableUSBFileTransfer();
                  disableFileTransfer();
                },
                child: Text("Disabled"))
          ],
        ),
      ),
    );
  }
}
