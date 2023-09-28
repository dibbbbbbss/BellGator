import 'package:bellgator_one_four/firebase_options.dart';
import 'package:bellgator_one_four/src/constants/app_theme.dart';
import 'package:bellgator_one_four/src/constants/color_strings.dart';
import 'package:bellgator_one_four/src/features/authentication/screens/splash_screen/splash_screen.dart';
// import 'package:bellgator_one_four/src/features/authentication/screens/welcome/welcome.dart';
// import 'package:bellgator_one_four/src/features/core/screens/dashboard/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bellgator_one_four/src/repository/authentication_repository/authentication_repository.dart';
import 'package:bellgator_one_four/src/features/core/screens/dashboard/newdashgg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (value) => Get.put(
      AuthenticationRepository(),
    ),
  );
  runApp(
    const MyApp(),
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.amber),
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: mainWalaColor),
      themeMode: appKoTheme,
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BELLGATOR"),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
