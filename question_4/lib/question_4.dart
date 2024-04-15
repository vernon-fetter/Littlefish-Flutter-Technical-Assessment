
import 'question_4_platform_interface.dart';

class Question_4 {
  Future<String?> getPlatformVersion() {
    return Question_4Platform.instance.getPlatformVersion();
  }
}
