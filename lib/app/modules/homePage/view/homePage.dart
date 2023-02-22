// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/modules/homePage/controller/homePageController.dart';
import 'package:flutter_assignment/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../profile/view/profile.dart';
import 'forYouTab.dart';

class HomePage extends GetView<HomePageController> {
  static const route = '/';
  static launch() => Get.toNamed(route);
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageController>(
        builder: (controller) => IndexedStack(
          index: controller.bottomTabIndex,
          children: [
            SafeArea(
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.width15 / 2, bottom: Dimensions.width15),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width15,
                          right: Dimensions.width15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              color: AppColors.black,
                              size: Dimensions.iconSize20 * 1.5,
                            ),
                            BigText(
                              text: "Categories",
                              fontWeight: FontWeight.bold,
                              size: Dimensions.font20 * 1.2,
                            ),
                            Icon(
                              Icons.search,
                              color: AppColors.black,
                              size: Dimensions.iconSize20 * 1.5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10 * 2.5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width15,
                          right: Dimensions.width15,
                        ),
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.pink,
                          controller: controller.tabController,
                          indicatorColor: Colors.pink,
                          labelPadding: null,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                          unselectedLabelStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const [
                            Tab(child: Text('For You')),
                            Tab(child: Text('Design')),
                            Tab(child: Text('Beauty')),
                            Tab(child: Text('Education')),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            const ForYouTab(),
                            Center(child: BigText(text: "Design Tab")),
                            Center(child: BigText(text: "Beauty Tab")),
                            Center(child: BigText(text: "Education Tab")),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Center(
              child: BigText(text: "Documents Page"),
            ),
            Center(
              child: BigText(text: "Favourites Page"),
            ),
            const UserProfile(),
            Center(
              child: BigText(text: "Settings"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: GetBuilder<HomePageController>(
          builder: (controller) {
            return BottomNavigationBar(
              onTap: (int index) {
                controller.changeBottomTabIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.bottomTabIndex,
              selectedItemColor: const Color(0xFFE75480),
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Padding(
                    padding: EdgeInsets.only(left: Dimensions.width10 / 2),
                    child: const Icon(
                      Icons.home,
                      size: 27,
                    ),
                  ),
                ),
                const BottomNavigationBarItem(
                  label: "Report",
                  icon: Icon(
                    Icons.data_usage,
                    size: 27,
                    // color: Colors.grey,
                  ),
                ),
                const BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.favorite,
                    size: 27,
                  ),
                ),
                const BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.person,
                    size: 27,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Padding(
                    padding: EdgeInsets.only(right: Dimensions.width10 / 2),
                    child: const Icon(
                      Icons.settings,
                      size: 27,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
