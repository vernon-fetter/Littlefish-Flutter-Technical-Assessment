import 'dart:async';

import 'package:flutter/services.dart';

class Question4 {
  static const MethodChannel _channel = MethodChannel('question_4');
  static const EventChannel _eventChannel =
      EventChannel('question_4/connectivity_events');

  static Stream<bool> _connectivityStream =
      _eventChannel.receiveBroadcastStream().map<bool>((dynamic isConnected) => isConnected);

  static Future<bool> checkConnectivity() async {
    final bool isConnected =
        await _channel.invokeMethod('checkConnectivity');
    return isConnected;
  }

  static Stream<bool> get onConnectivityChanged => _connectivityStream;
}
