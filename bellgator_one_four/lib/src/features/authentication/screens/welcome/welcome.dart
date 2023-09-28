import 'package:bellgator_one_four/src/constants/image_strings.dart';
import 'package:bellgator_one_four/src/features/authentication/screens/login/login_screen.dart';
import 'package:bellgator_one_four/src/features/authentication/screens/signup/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(
                    tSplashIcon,
                  ),
                  height: height * 0.3,
                ),
                Column(
                  children: [
                    Text("BELLGATOR",
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text(
                      "Schedule Manager App",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: Text("LOGIN"))),
                    SizedBox(
                      width: 25,
                      height: 0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0),
                        onPressed: () {
                          Get.to(() => const SignUpScreen());
                        },
                        child: Text("SIGN UP"),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
