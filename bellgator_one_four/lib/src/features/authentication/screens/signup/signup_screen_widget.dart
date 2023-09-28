import 'package:bellgator_one_four/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      SignUpController(),
    );

    final _formkey = GlobalKey<FormState>();
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.fullname,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_rounded),
                labelText: "Your Full-Name Here",
                hintText: "First-Name Last-Name",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_rounded),
              labelText: "Enter your email",
              hintText: "",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            obscureText: true,
            controller: controller.password,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_rounded),
              labelText: "Create a new password",
              hintText: "******************",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.password),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Forgot Password ?"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  SignUpController.instance.registeredUser(
                    controller.email.text.trim(),
                    controller.password.text.trim(),
                  );
                }
              },
              child: Text("SIGNUP"),
            ),
          ),
        ],
      ),
    );
  }
}
