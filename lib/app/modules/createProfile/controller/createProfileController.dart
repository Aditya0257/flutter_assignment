// ignore_for_file: file_names
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/loading.dart';
import '../../../../helper/shared_preference.dart';
import '../../../../helper/snackbar.dart';
import '../../homePage/view/homePage.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController proffession = TextEditingController();
  TextEditingController emailId = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String value = 'Male';
  List<String> dropDownList = ['Male', 'Female', 'Others'];
  onChangedList(String x) {
    value = x;
    update();
  }

  final ImagePicker imagePicker = ImagePicker();
  File image = File("");

  void getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      print(pickedFile.path);
      SPController().setUserImage(pickedFile.path);
      image = File(pickedFile.path);
      update();
    } else {
      Get.snackbar("Error", "No image selected",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  final users = FirebaseFirestore.instance.collection('user');
  final prefs = SPController();
  onCreateProfile() async {
    LoadingUtils.showLoader();
    try {
      await users.doc().set({
        "name": name.text,
        "address": address.text,
        "mobileNumber": mobileNumber.text,
        'proffession': proffession.text,
        'emailId': emailId.text,
      }).then((value) {
        SPController().setUserName(name.text);
        LoadingUtils.hideLoader();
        HomePage.launch();
      });
    } catch (err) {
      LoadingUtils.hideLoader();
      snackbar(err.toString());
    }
  }
}
