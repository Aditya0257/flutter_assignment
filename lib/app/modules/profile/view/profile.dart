import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/modules/profile/controller/profileController.dart';
import 'package:flutter_assignment/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../../../helper/shared_preference.dart';
import '../../../../utils/dimensions.dart';
import '../../../data/models/userInfo.dart';

class UserProfile extends GetView<ProfileController> {
  static const route = '/user-profile';
  static launch() => Get.toNamed(route);
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xFFD3D3D3),
        ),
        Container(
            height: Dimensions.height10 * 35,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: FileImage(File(SPController().getUserImage())),
                  fit: BoxFit.fill),
            )),
        Positioned(
          left: Dimensions.height10 * 1.2,
          right: Dimensions.height10 * 1.2,
          top: Dimensions.height10 * 28,
          child: Stack(
            children: [
              Container(
                height: Dimensions.height10 * 21,
                width: Dimensions.screenWidth * 0.935,
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: Dimensions.height10 * 19,
                  width: Dimensions.screenWidth * 0.93,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 / 2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Dimensions.width10 * 12,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: SPController().getUserName(),
                                  size: Dimensions.font20 * 1.1,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                BigText(
                                  text: "Product Designer",
                                  size: Dimensions.font15 * 1.3,
                                ),
                                SizedBox(
                                  height: Dimensions.height10 / 2,
                                ),
                                BigText(
                                  text: "Kathmandu",
                                  color: Colors.grey,
                                  size: Dimensions.font15 * 1.2,
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                              ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: "285",
                                size: Dimensions.font15 * 1.1,
                              ),
                              BigText(
                                text: "Likes",
                                size: Dimensions.font15 * 1.1,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: "3025",
                                size: Dimensions.font15 * 1.1,
                              ),
                              BigText(
                                text: "Comments",
                                size: Dimensions.font15 * 1.1,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: "650",
                                size: Dimensions.font15 * 1.1,
                              ),
                              BigText(
                                text: "Favourites",
                                size: Dimensions.font15 * 1.1,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 0,
                child: Container(
                    height: Dimensions.height10 * 8,
                    width: Dimensions.width10 * 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                      image: DecorationImage(
                          image: FileImage(File(SPController().getUserImage())),
                          fit: BoxFit.fill),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: Dimensions.height10 * 1.2,
          right: Dimensions.height10 * 1.2,
          bottom: 0.01,
          child: Container(
            height: Dimensions.height10 * 33,
            width: Dimensions.screenWidth * 0.93,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius15 / 2)),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.height10 * 1.3),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: BigText(
                    text: "User information",
                    size: Dimensions.font20 * 1.2,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                const Divider(
                  thickness: 0.7,
                  color: Color(0xFFD3D3D3),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: userInfo.length,
                      itemBuilder: (context, index) {
                        return _userInfo(context, index);
                      }),
                )
              ]),
            ),
          ),
        ),
        // Positioned(
        //     top: Dimensions.height30 * 2,
        //     left: Dimensions.width20,
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: AppColors.white,
        //       size: Dimensions.iconSize24 * 1.2,
        //     ),),
      ],
    );
  }

  Widget _userInfo(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height15),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              userInfo[index].icon,
              size: Dimensions.iconSize24 * 1.2,
              color: Colors.grey,
            ),
            SizedBox(width: Dimensions.width30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: userInfo[index].name),
                SizedBox(
                  height: Dimensions.height10,
                ),
                BigText(
                  text: userInfo[index].data,
                  size: Dimensions.font15,
                  color: Colors.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
