import 'package:get/get.dart';

class SimpleController extends GetxController {
  int counter = 0;

  void increase() {
    counter++;
    update(); // 현 Controller 를 바라보는 모드느 위젯에 업데이트 알림
  }
}
