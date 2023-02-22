
import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/modules/createProfile/view/createProfile.dart';
import 'package:flutter_assignment/app/modules/homePage/view/homePage.dart';
import 'package:get/get.dart';

import '../helper/shared_preference.dart';
import '../routes/routes.dart';
import '../utils/theme.dart';
import 'modules/onBoarding/view/on_boarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      getPages: AppRoutes.pages,
      initialRoute: 
      SPController().getIsLoggedin()? HomePage.route:
      // CreateProfile.route
      OnBoarding.route
      ,
    );
  }
}
