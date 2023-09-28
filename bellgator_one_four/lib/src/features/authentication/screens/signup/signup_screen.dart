import 'package:bellgator_one_four/src/constants/image_strings.dart';
import 'package:bellgator_one_four/src/features/authentication/screens/signup/signup_screen_widget.dart';
import 'package:flutter/material.dart';
// import 'package:bellgator_one_four/src/features/authentication/screens/login/login_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage(tSplashIcon),
                    height: height1 * 0.3,
                  ),
                  Text(
                    "Create a new Account",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SignupForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
