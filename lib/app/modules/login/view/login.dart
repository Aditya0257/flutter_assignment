import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/colors.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_field.dart';
import '../../login/controller/loginController.dart';

class Login extends GetView<LoginController> {
  static const route = '/login';
  static launch() => Get.toNamed(route);
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(Dimensions.height30),
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, size: Dimensions.iconSize20*1.4,),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                BigText(
                  text: 'Login',
                  size: Dimensions.font20 * 1.7,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: Dimensions.height10 / 2,
                ),
                BigText(
                  text: 'Please enter your Phone or Email',
                  size: Dimensions.font15 * 1.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  indicator: MaterialIndicator(
                    color: AppColors.deepGreen,
                    height: Dimensions.height10*0.6,
                    topLeftRadius: Dimensions.width10*0.8,
                    topRightRadius: Dimensions.width10*0.8,
                    horizontalPadding: Dimensions.width10,
                    tabPosition: TabPosition.bottom,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Phone Number',
                    ),
                    Tab(
                      text: 'Email',
                    )
                  ],
                ),
                GetBuilder<LoginController>(
                  builder: ((controller) {
                    return Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .06,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height:
                                      MediaQuery.of(context).size.width * .15,
                                  decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.all(
                                          Radius.circular(Dimensions.radius20)),
                                      border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: EdgeInsets.all(Dimensions.height10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: controller.otpScreen
                                              ? Text(
                                                  controller.selectedCountry,
                                                  style:  TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: Dimensions.font15*1.1),
                                                )
                                              : TextButton(
                                                  onPressed: () {
                                                    controller
                                                        .showCountryPicker();
                                                  },
                                                  child: Text(
                                                    controller.selectedCountry,
                                                    style:  TextStyle(
                                                        color: AppColors.black,
                                                        fontSize: Dimensions.font15*1.1),
                                                  )),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: controller.otpScreen
                                              ? Text(controller.phonenumber)
                                              : TextField(
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  onChanged: (value) {
                                                    controller.phonenumber =
                                                        value;
                                                  },
                                                  decoration: const InputDecoration(
                                                      prefixIcon: Icon(
                                                          Icons.phone,
                                                          color: AppColors
                                                              .deepGreen),
                                                      labelStyle: TextStyle(
                                                          color: AppColors
                                                              .deepGreen),
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Enter Phone Number'),
                                                ),
                                        
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                ),
                                controller.otpScreen
                                    ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text('Wrong number? '),
                                              TextButton(
                                                  onPressed: () {
                                                    controller.otpScreen =
                                                        false;
                                                  },
                                                  child: const Text(
                                                    'Change',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blueAccent),
                                                  ))
                                            ],
                                          ),
                                           Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Enter OTP',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: Dimensions.font20*1.1),
                                              )),
                                           Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "We've sent the code verification to your phone number",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Dimensions.font15*1.1),
                                              )),
                                           SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          SizedBox(
                                            child: PinCodeTextField(
                                                pinTheme: PinTheme(
                                                  shape: PinCodeFieldShape.box,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  activeColor: Colors.yellow,
                                                  inactiveColor:
                                                      Colors.grey[350],
                                                  selectedColor: Colors.yellow,
                                                ),
                                                appContext: context,
                                                length: 6,
                                                onChanged: (value) {
                                                  controller.phoneotp = value;
                                                }),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          Button(
                                              on_pressed: () async {
                                                controller.onPhoneLogin();
                                              },
                                              text: 'Login'),
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                           Text(
                                            'By clicking Login, you accept our',
                                            style: TextStyle(fontSize: Dimensions.font20),
                                          ),
                                           Text(
                                            'Terms & Conditions',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: Dimensions.font20),
                                          )
                                        ],
                                      )
                                    : Button(
                                        on_pressed: () async {
                                          controller.onSendOTP();
                                        },
                                        text: 'Send OTP'),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .06,
                                ),
                                Text_Field(
                                  radius: Dimensions.radius20,
                                  text_field_width: double.maxFinite,
                                  text_field_height: Dimensions.height20 * 3,
                                  text_field: TextField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      controller.email = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.mail,
                                          color: AppColors.deepGreen,
                                        ),
                                        border: InputBorder.none,
                                        hintText: controller.emailSignup
                                            ? 'Create new Mail Id'
                                            : 'Enter Mail Id'),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02,
                                ),
                                Text_Field(
                                  radius: Dimensions.radius20,
                                  text_field_width: double.maxFinite,
                                  text_field_height: Dimensions.height20 * 3,
                                  text_field: TextField(
                                    onChanged: (value) {
                                      controller.password = value;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.security,
                                          color: AppColors.deepGreen,
                                        ),
                                        border: InputBorder.none,
                                        hintText: controller.emailSignup
                                            ? 'Create new password'
                                            : 'Enter Password'),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                controller.emailSignup
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                              "Already have an account?  "),
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .onChangedEmailSignup(false);
                                            },
                                            child: const Text(
                                              "Log In ",
                                              style: TextStyle(
                                                  color: AppColors.deepGreen),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                              "Don't have an account?  "),
                                          GestureDetector(
                                              onTap: () {
                                                controller
                                                    .onChangedEmailSignup(true);
                                              },
                                              child: const Text(
                                                "Sign Up ",
                                                style: TextStyle(
                                                    color: AppColors.deepGreen),
                                              )),
                                        ],
                                      ),
                                controller.emailSignup
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          Button(
                                              on_pressed: () async {
                                                controller.onSignup();
                                              },
                                              text: 'Signup'),
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          Text(
                                            'By clicking Signup, you accept our',
                                            style: TextStyle(
                                                fontSize:
                                                    Dimensions.font15 * 1.1),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10 / 2,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              'Terms & Conditions',
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize:
                                                      Dimensions.font15 * 1.2),
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: Dimensions.height20,
                                          ),
                                          Button(
                                              on_pressed: () async {
                                                controller.onLogin();
                                              },
                                              text: 'Login'),
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
