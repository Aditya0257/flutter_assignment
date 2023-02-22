// ignore_for_file: file_names
import 'package:get/get.dart';
import '../../profile/controller/profileController.dart';
import '../controller/homePageController.dart';

class HomePageBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => HomePageController(),);
    Get.lazyPut(() => ProfileController());
  }
}