import 'package:bellgator_one_four/src/features/authentication/screens/welcome/welcome.dart';
import 'package:bellgator_one_four/src/features/core/screens/dashboard/dashboard.dart';
import 'package:bellgator_one_four/src/repository/exceptions/signup_email_password_failure.dart';
// import 'package:flutter/material.dart';
import 'package:bellgator_one_four/src/features/core/screens/dashboard/newdashgg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // creating firebase variables

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomeScreen())
        : Get.offAll(() => /*const*/ DashboardScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
// place exception here
    } catch (_) {}
  }

//email verification:

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = null;
      throw ex.message;
    } catch (_) {
      const ex = null;
      throw ex.message;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => /*const*/ DashboardScreen())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
// place exception here

      final ex = SignInWithEmailAndPasswordFailure.code(e.code);
      print('firebase auth exceptionz - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignInWithEmailAndPasswordFailure();
      print('exception - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
