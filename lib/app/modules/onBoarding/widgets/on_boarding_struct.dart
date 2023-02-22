import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/modules/onBoarding/controller/on_boardingController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';

class OnBoardingStrct extends GetView<OnBoardingController> {
  final String header;
  final String title;
  final Color color;
  final String image;
  const OnBoardingStrct({super.key, required this.header, required this.title, required this.color, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: color,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                  Dimensions.width20, Dimensions.height40, Dimensions.width20, Dimensions.height40),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BigText(
                                text: header,
                                fontWeight: FontWeight.bold,
                                size: Dimensions.font20 * 1.5,
                                color: AppColors.white,
                              ),
                              BigText(
                                  text: title,
                                  size: Dimensions.font20,
                                  color: AppColors.white,
                                  maxLines: 2)
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 7,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimensions.height40*2,),
                                  decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     color: AppColors.white,
                                    //  image: DecorationImage(image: NetworkImage(image),fit:BoxFit.cover)
                                  ),
                                  child: SizedBox(
                                    child: CachedNetworkImage(
                                      cacheManager: controller.customCacheManager,
                                      key: UniqueKey(),
                                      imageUrl: image,
                                      fit:BoxFit.cover,
                                      placeholder: ((context, url) => const SizedBox(
                                        // height: 300,
                                        width: double.maxFinite,
                                        child: CircularProgressIndicator.adaptive(  
                                        ))),
                                      errorWidget: ((context, url, error) => Container(
                                        color: Colors.black12,
                                        child: Icon(Icons.error, color: Colors.red, size: Dimensions.iconSize20*4,),
                                      )),
                                      ),
                                  ),
                            )),
                      ],
                    ),
                  ),
                );
  }
}