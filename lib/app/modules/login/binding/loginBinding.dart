// ignore_for_file: file_names

import 'package:get/get.dart';

import '../../login/controller/loginController.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
