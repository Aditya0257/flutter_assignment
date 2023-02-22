// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/modules/homePage/controller/homePageController.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_assignment/widgets/categoryListItem.dart';
import 'package:get/get.dart';
import '../../../../utils/dimensions.dart';

class ForYouTab extends GetView<HomePageController> {
  const ForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD3D3D3),
      padding: EdgeInsets.only(
        left: Dimensions.width10,
        right: Dimensions.width10,
      ),
      child: GetBuilder<HomePageController>(
        builder: ((controller) {
          return controller.isloading
              ? Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade300,
                  child: ListView.builder(
                    itemCount: controller.categoriesList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (_, __) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.height40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: Dimensions.height10 * 9.5,
                                width: Dimensions.width10 * 8,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.height15,
                                      vertical: Dimensions.height10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: Dimensions.width10 * 28,
                                        height: Dimensions.height10,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Dimensions.height10 / 3),
                                      ),
                                      Container(
                                        width: Dimensions.width10 * 28,
                                        height: Dimensions.height10,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: Dimensions.height10 / 3),
                                      ),
                                      Container(
                                        width: Dimensions.width10 * 18,
                                        height: Dimensions.height10,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height15 * 1.1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Dimensions.width10 * 9,
                                            height: Dimensions.height10,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: Dimensions.width20,
                                          ),
                                          Container(
                                            width: Dimensions.width10 * 9,
                                            height: Dimensions.height10,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  // separatorBuilder: (context, index) => SizedBox(height: Dimensions.height10,),
                  itemCount: controller.categoriesList.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: double.maxFinite,
                              // decoration:
                              //     const BoxDecoration(color: Color.fromARGB(255, 255, 51, 51)),
                              child: CategoryListItem(
                                categoryList: controller.categoriesList[index],
                              ),
                            )),
                      ],
                    );
                  });
        }),
      ),
    );
  }
}
