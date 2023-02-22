import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/modules/onBoarding/controller/on_boardingController.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/indicator.dart';
import '../widgets/on_boarding_struct.dart';
import '../../homePage/view/homePage.dart';
import '../../logIn/view/login.dart';

class OnBoarding extends GetView<OnBoardingController> {
  static const route = '/on_boarding';
  static launch() => Get.toNamed(route);
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.deepGreen,
        body: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                controller.onPageChanged(value);
              },
              controller: controller.controller,
              children: const [
                OnBoardingStrct(
                    header: 'Welcome',
                    title: 'Welcome to this awesome intro\nscreen app.',
                    color: AppColors.deepGreen,
                    image:
                        'https://miro.medium.com/max/1062/1*Uu3kKQ_lVDc3ct5NQSsgxw.png'),
                OnBoardingStrct(
                    header: 'Awesome App',
                    title: 'This is an awesome app, of intro\nscreen design.',
                    color: AppColors.orange,
                    image:
                        'https://acuvate.com/compass/wp-content/uploads/2020/11/data-analytics-companies-usa-banner-1-featured.png'),
                OnBoardingStrct(
                    header: 'Flutter App',
                    title: 'Flutter is awesome for app \ndevelopment',
                    color: AppColors.grey,
                    image:
                        'https://www.ag-solutions.in/assets/images/mobile-app-architecture.png'),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(Dimensions.width20, 0,
                      Dimensions.width20, Dimensions.height20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                          text: 'Skip',
                          color: AppColors.black,
                          size: Dimensions.font15),
                      Obx(
                        () => Row(
                          children: [
                            Indicator(
                                scale: controller.page.value == 0 ? 1 : 0.5,
                                color: controller.page.value == 0
                                    ? AppColors.pink
                                    : AppColors.white),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Indicator(
                                scale: controller.page.value == 1 ? 1 : 0.5,
                                color: controller.page.value == 1
                                    ? AppColors.pink
                                    : AppColors.white),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Indicator(
                                scale: controller.page.value == 2 ? 1 : 0.5,
                                color: controller.page.value == 2
                                    ? AppColors.pink
                                    : AppColors.white),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (controller.page.value == 2) {
                            Login.launch();
                          } else {
                            controller.onPageUpdate();
                            controller.controller
                                .jumpToPage(controller.page.value);
                          }
                        },
                        icon: Obx(() => Icon(controller.page.value == 2
                            ? Icons.done_outlined
                            : Icons.arrow_forward_ios_outlined)),
                        color: AppColors.black,
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
