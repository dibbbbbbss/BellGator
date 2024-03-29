import 'package:bellgator_one_four/src/features/authentication/screens/welcome/welcome.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimate() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 1500));
    Get.to(() => const WelcomeScreen());
  }
}
