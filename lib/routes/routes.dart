import 'package:get/get.dart';

import '../app/modules/createProfile/binding/createProfileBinding.dart';
import '../app/modules/createProfile/view/createProfile.dart';
import '../app/modules/homePage/binding/homePageBinding.dart';
import '../app/modules/homePage/view/homePage.dart';
import '../app/modules/logIn/binding/loginBinding.dart';
import '../app/modules/logIn/view/login.dart';
import '../app/modules/onBoarding/binding/on_boardingBinding.dart';
import '../app/modules/onBoarding/view/on_boarding.dart';
import '../app/modules/profile/view/profile.dart';

class AppRoutes {
  static final pages = <GetPage<dynamic>>[

    GetPage(
      name: OnBoarding.route,
      page: () => const OnBoarding(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: HomePage.route,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
  
    GetPage(
      name: CreateProfile.route,
      page: () => const CreateProfile(),
      binding: CreateProfileBinding(),
    ),
   
    GetPage(
      name: Login.route,
      page: () => const Login(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: UserProfile.route,
      page: () => const UserProfile(),
    ),

  ];
}

class Profile {
}
