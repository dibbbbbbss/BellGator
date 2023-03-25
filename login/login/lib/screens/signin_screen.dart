import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login/utils/color_utils.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});



  @override
  State<SignInScreen> createState() => _SignInScreenState();
}



class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
    hexStringToColor("#21b6a8"),
    hexStringToColor("#a3ebb1"),

    hexStringToColor("#116530"),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),),);
  }
}