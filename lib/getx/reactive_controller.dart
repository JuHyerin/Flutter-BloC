import 'package:get/get.dart';

class ReactiveController extends GetxController {
  // Rx<int> counter = 0.obs;
  RxInt counter = 0.obs;
  // RxInt counter = RxInt(0);

  void increase() {
    counter++; // Observable 변수이므로 직접 update() 하여 알리지 않아도 됨
  }

  @override
  void onInit() {
    super.onInit();

    // Rx 의 Worker 등록
    once(counter, (_) => print('[once] $counter가 처음 변경되었습니다.'));
    ever(counter, (_) => print('[ever] $counter가 변경되었습니다.'));
    debounce(
      counter,
      (_) => print('[debounce] $counter가 마지막 변경이후 , 5초간 변경이 없습니다.'),
      time: const Duration(seconds: 5)
    );
    interval(
      counter,
      (_) => print('[debounce] $counter가 변경되는 중입니다. (5초마다 호출)'),
      time: const Duration(seconds: 5)
    );
  }

}
