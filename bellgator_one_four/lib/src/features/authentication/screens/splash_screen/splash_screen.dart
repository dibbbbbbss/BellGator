// import 'dart:ffi';
import 'package:get/get.dart';
// import 'package:bellgator_one_four/src/features/authentication/screens/welcome/welcome.dart';

import 'package:bellgator_one_four/src/constants/image_strings.dart';
import 'package:bellgator_one_four/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController = Get.put(SplashScreenController());

  @override
  void initState() {
    super.initState();
    SplashController.startAnimate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: SplashController.animate.value ? 0 : 100,
              left: SplashController.animate.value ? 0 : 100,
              child: Image(
                height: 175,
                width: 175,
                image: AssetImage(tSplashIcon),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BELLGATOR",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  "a routine manager app",
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              height: SplashController.animate.value ? 0 : 100,
              width: SplashController.animate.value ? 0 : 100,
              bottom: 0,
              right: 0,
              child: Image(
                image: AssetImage(tSplashIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
