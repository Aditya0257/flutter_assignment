import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/homeCategory.dart';

class HomePageController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late bool isloading;
  final List<HomeCategory> categoriesList = [...HomeCategory.getHomeCategory()];

  int bottomTabIndex = 0;

  @override
  void onInit() {
    super.onInit();
    debugPrint("Initializing HomePage, Hello everyone.");
    tabController = TabController(length: 4, vsync: this);
    isloading = true;
    Future.delayed(const Duration(seconds: 2), () {
      isloading = false;
      update();
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void changeBottomTabIndex(int index) {
    bottomTabIndex = index;
    update();
  }
}
