// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/drop_down.dart';
import '../../../../widgets/text_field.dart';
import '../../homePage/view/homePage.dart';
import '../controller/createProfileController.dart';

class CreateProfile extends GetView<CreateProfileController> {
  static const route = '/create-profile';
  static launch() => Get.toNamed(route);
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
              padding: EdgeInsets.fromLTRB(Dimensions.width15,
                  Dimensions.height20, Dimensions.width15, Dimensions.height30),
              child: Column(
                children: [
                  BigText(
                    text: 'Create Profile',
                    size: Dimensions.font20 * 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  GetBuilder<CreateProfileController>(
                    builder: (controller) {
                      return CircleAvatar(
                        radius: Dimensions.radius20 * 4,
                        backgroundColor: Colors.grey,
                        // ignore: unnecessary_null_comparison
                        backgroundImage: controller.image == null
                            ? null
                            : FileImage(controller.image),
                      );
                    },
                  ),
                  SizedBox(height: Dimensions.height20),
                  InkWell(
                    onTap: () {
                      Get.dialog(
                          barrierDismissible: false,
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        width: 2, color: AppColors.white),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Dimensions.radius15))),
                                child: Material(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius15)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.height10),
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        BigText(
                                          text: 'Add a photo for Profile Pic',
                                          size: Dimensions.font15 * 1.3,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                controller.getImage(
                                                    ImageSource.gallery);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.grey,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                minimumSize:
                                                    const Size(160, 40),
                                              ),
                                              child: const Text(
                                                  "Choose from gallery"),
                                            ),
                                            SizedBox(width: Dimensions.width10),
                                            ElevatedButton(
                                              onPressed: () {
                                                controller.getImage(
                                                    ImageSource.camera);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.grey,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                minimumSize:
                                                    const Size(160, 40),
                                              ),
                                              child: const Text("Take a photo"),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.deepGreen,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              minimumSize: const Size(150, 40),
                                            ),
                                            child: const Text("Go Back")),
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: Dimensions.iconSize24,
                        ),
                        BigText(
                          text: "Add Photo",
                          size: Dimensions.font15 * 1.1,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height15),
                  Text_Field(
                      radius: Dimensions.radius20,
                      text_field_width: double.maxFinite,
                      text_field_height: Dimensions.height20 * 3,
                      text_field: TextFormField(
                        autofocus: true,
                        controller: controller.name,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.deepGreen,
                          ),
                          hintText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Text_Field(
                    radius: Dimensions.radius20,
                    text_field_width: double.maxFinite,
                    text_field_height: Dimensions.height20 * 3,
                    text_field: Center(
                      child: TextFormField(
                        controller: controller.mobileNumber,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: AppColors.deepGreen,
                          ),
                          hintText: 'Mobile No.',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your Phone no.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Text_Field(
                      radius: Dimensions.radius20,
                      text_field_width: double.maxFinite,
                      text_field_height: Dimensions.height20 * 5,
                      text_field: Center(
                        child: SingleChildScrollView(
                          child: TextFormField(
                            controller: controller.address,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: AppColors.deepGreen,
                              ),
                              hintText: 'Address',
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter your Address";
                              }
                              return null;
                            },
                          ),
                        ),
                      )),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<CreateProfileController>(
                        builder: ((controller) {
                          return DropDown(
                            width: Dimensions.width40 * 4.7,
                            height: Dimensions.height20 * 3,
                            name: 'Gender',
                            value: controller.value,
                            items: controller.dropDownList.map((String items) {
                              return DropdownMenuItem(
                                alignment: Alignment.center,
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              controller.onChangedList(newValue.toString());
                            },
                          );
                        }),
                      ),
                      Text_Field(
                          radius: Dimensions.radius20,
                          text_field_width: Dimensions.width40 * 4.7,
                          text_field_height: Dimensions.height20 * 3,
                          text_field: TextFormField(
                            controller: controller.proffession,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.sensor_occupied,
                                color: AppColors.deepGreen,
                              ),
                              hintText: 'Profession',
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter your profession";
                              }
                              return null;
                            },
                          )),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Text_Field(
                      radius: Dimensions.radius20,
                      text_field_width: double.maxFinite,
                      text_field_height: Dimensions.height20 * 3,
                      text_field: TextFormField(
                        controller: controller.emailId,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.car_rental,
                            color: AppColors.deepGreen,
                          ),
                          hintText: 'email id',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your email Id";
                          }
                          return null;
                        },
                      )),
                  const Spacer(),
                  Button(
                    width: double.maxFinite,
                    height: Dimensions.height40 * 1.5,
                    radius: Dimensions.radius20 * 2,
                    on_pressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.onCreateProfile();
                        // HomePage.launch();
                      }
                    },
                    text: 'CONTINUE',
                    color: AppColors.deepGreen,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
