import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'question_4_method_channel.dart';

abstract class Question_4Platform extends PlatformInterface {
  /// Constructs a Question_4Platform.
  Question_4Platform() : super(token: _token);

  static final Object _token = Object();

  static Question_4Platform _instance = MethodChannelQuestion_4();

  /// The default instance of [Question_4Platform] to use.
  ///
  /// Defaults to [MethodChannelQuestion_4].
  static Question_4Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Question_4Platform] when
  /// they register themselves.
  static set instance(Question_4Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
