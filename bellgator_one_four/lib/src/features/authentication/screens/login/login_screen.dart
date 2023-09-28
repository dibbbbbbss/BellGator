import 'package:bellgator_one_four/src/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:bellgator_one_four/src/features/authentication/screens/login/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    "Welcome Back !!!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "login here",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
