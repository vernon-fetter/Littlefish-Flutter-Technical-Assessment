import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'question_4_platform_interface.dart';

/// An implementation of [Question_4Platform] that uses method channels.
class MethodChannelQuestion_4 extends Question_4Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('question_4');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
