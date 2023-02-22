// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{


  @override
    void onInit() {
      controller=PageController(initialPage: page.value);
      update();
      super.onInit();
    }

  final customCacheManager = CacheManager(
    Config("customCacheKey", 
    stalePeriod: const Duration(days: 20),
    maxNrOfCacheObjects: 50
    )
  );


  late PageController controller;

  final page=0.obs;

  onPageUpdate(){
    page((page.value+1));
  }

  onPageChanged(int x){
    page(x);
  }

}