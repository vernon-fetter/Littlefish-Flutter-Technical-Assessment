import 'package:flutter_test/flutter_test.dart';
import 'package:question_4/question_4.dart';
import 'package:question_4/question_4_platform_interface.dart';
import 'package:question_4/question_4_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQuestion_4Platform
    with MockPlatformInterfaceMixin
    implements Question_4Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Question_4Platform initialPlatform = Question_4Platform.instance;

  test('$MethodChannelQuestion_4 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQuestion_4>());
  });

  test('getPlatformVersion', () async {
    Question_4 question_4Plugin = Question_4();
    MockQuestion_4Platform fakePlatform = MockQuestion_4Platform();
    Question_4Platform.instance = fakePlatform;

    expect(await question_4Plugin.getPlatformVersion(), '42');
  });
}
