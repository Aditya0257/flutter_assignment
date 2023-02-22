import 'package:flutter_assignment/app/modules/onBoarding/controller/on_boardingController.dart';
import 'package:get/get.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
