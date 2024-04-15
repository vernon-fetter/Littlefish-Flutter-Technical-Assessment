import 'package:flutter/material.dart';
import 'package:question_4/question_4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    Question4.onConnectivityChanged.listen((isConnected) {
      setState(() {
        _isConnected = isConnected;
      });
    });
  }

  Future<void> _initConnectivity() async {
    bool isConnected = await Question4.checkConnectivity();
    setState(() {
      _isConnected = isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device Internet Connectivity Status'),
        ),
        body: Center(
          child: Text(
            _isConnected ? 'Connected' : 'Disconnected',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
