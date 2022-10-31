import 'package:get/get.dart';

class ReactiveController extends GetxController {
  // Rx<int> counter = 0.obs;
  RxInt counter = 0.obs;
  // RxInt counter = RxInt(0);

  void increase() {
    counter++; // Observable 변수이므로 직접 update() 하여 알리지 않아도 됨
  }
}
