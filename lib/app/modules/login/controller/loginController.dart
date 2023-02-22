// ignore_for_file: file_names

import 'package:country_calling_code_picker/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/shared_preference.dart';
import '../../createProfile/view/createProfile.dart';
import '../../homePage/view/homePage.dart';

class LoginController extends GetxController {
  bool otpScreen = false;
  bool emailSignup = false;

  final auth = FirebaseAuth.instance;

  String verification = '';
  bool loading = false;

  String email = '';
  String password = '';
  String selectedCountry = '';
  late String phoneotp;
  String phonenumber = '';

  @override
  void onInit() {
    super.onInit();
    initCountry();
  }

  onChangedOtpScreen(bool x) {
    otpScreen = x;
    update();
  }

  onChangedEmailSignup(bool x) {
    emailSignup = x;
    update();
  }

  void initCountry() async {
    final country = await getDefaultCountry(Get.context!);
    selectedCountry = country.callingCode;
    update();
  }

  void showCountryPicker() async {
    final country = await showCountryPickerDialog(
      Get.context!,
    );
    if (country != null) {
      selectedCountry = country.callingCode;
      update();
    }
  }

  onSendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: selectedCountry + phonenumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          debugPrint(phonenumber);
          debugPrint('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verification = verificationId;

        onChangedOtpScreen(true);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  onLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          
      SPController().setIsLoggedin(true) ;
      HomePage.launch();
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (err.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  onPhoneLogin() async {
    loading = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verification, smsCode: phoneotp);
      await FirebaseAuth.instance.signInWithCredential(credential);
      HomePage.launch();
    } catch (err) {
      debugPrint(err.toString());
    }
    loading = false;
  }

  onSignup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
      
      SPController().setIsLoggedin(true) ;
      CreateProfile.launch();
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (err.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    }
  }
}
