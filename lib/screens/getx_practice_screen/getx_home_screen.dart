import 'package:flutter/material.dart';
import 'package:flutter_state_manager/getx/reactive_controller.dart';
import 'package:flutter_state_manager/getx/simple_controller.dart';
import 'package:get/get.dart';

class GetxHomeScreen extends StatelessWidget {
  GetxHomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller 등록
    Get.put(SimpleController());
    Get.put(ReactiveController());

    print('builder 0');

    return Scaffold(
      appBar: AppBar(title: const Text('단순/반응형 상태 관리'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ // 각각의 빌더가 개별적으로 호출됨 (해당 빌더의 state 변화에 따른 리렌더링 필요 시)
            GetBuilder<SimpleController>( //실시간 렌더링
              builder: (controller) {
                print('builder 1');

                return ElevatedButton(
                    onPressed: () {
                      // Get.find<SimpleController>().increase();
                      controller.increase(); // controller 를 바라보는 child 객체 업데이트
                    },
                    child: Text('[단순]현재 숫자: ${controller.counter}')
                );
              },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            GetX<ReactiveController>(
                builder: (controller) {
                  print('builder 2');

                  return ElevatedButton(
                      onPressed: () {
                        // Get.find<SimpleController>().increase();
                        controller.increase(); // controller 를 바라보는 child 객체 업데이트
                      },
                      child: Text('[반응형-1]현재 숫자: ${controller.counter}')
                  );
                },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Obx( // Controller 지정할 수 없음
              () { // 빌더함수만 파라미터로 받음
                print('builder 3');

                return ElevatedButton(
                    onPressed: () {
                      // Get.find<SimpleController>().increase();
                      Get.find<ReactiveController>().increase(); // controller 를 바라보는 child 객체 업데이트
                    },
                    child: Text('[반응형-2]현재 숫자: ${Get.find<ReactiveController>().counter}')
                );
              },
            )
          ],
        )
      ),
    );
  }
}
