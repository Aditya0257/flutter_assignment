// ignore_for_file: file_names

import 'package:get/get.dart';
import '../controller/createProfileController.dart';


class CreateProfileBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => CreateProfileController(),);
  }
}