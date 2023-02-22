import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/colors.dart';
import 'package:flutter_assignment/widgets/big_text.dart';

import '../app/data/models/homeCategory.dart';
import '../utils/dimensions.dart';

class CategoryListItem extends StatelessWidget {
  final HomeCategory categoryList;
  const CategoryListItem({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //const Color(0xFFD3D3D3),
      //padding: EdgeInsets.all(Dimensions.height10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: Dimensions.screenWidth * 0.175,
              width: Dimensions.screenWidth * 0.175,
              decoration: const BoxDecoration(color: Color(0xFFFFB6C1)),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width10 * 1.5,
                vertical: Dimensions.height10 * 1.5),
            // width:Dimensions.screenWidth*0.8,
            // height: Dimensions.screenWidth*0.,
            padding: EdgeInsets.all(Dimensions.height10),
            decoration: const BoxDecoration(color: AppColors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20 / 2),
                    color: Colors.white,
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                      )
                    ],
                  ),
                  child: Image.network(
                    categoryList.image,
                    height: Dimensions.height10 * 10,
                    width: Dimensions.width10 * 8,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: Dimensions.width15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BigText(
                        text: categoryList.header,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: Dimensions.height10 / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xFFE75480),
                                radius: Dimensions.radius20 / 1.5,
                              ),
                              SizedBox(
                                width: Dimensions.width10 / 2,
                              ),
                              BigText(
                                text: categoryList.name,
                                size: Dimensions.font15,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                              BigText(
                                text: categoryList.readTime,
                                size: Dimensions.font15,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
