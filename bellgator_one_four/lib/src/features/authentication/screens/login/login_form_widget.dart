import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Login successful, navigate to dashboard or another screen
    } catch (e) {
      // Login failed, handle the error
      print('Error logging in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_rounded),
              labelText: "Your email here",
              hintText: "someone@email.com",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 25),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_rounded),
              labelText: "Your password here",
              hintText: "******************",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.remove_red_eye_sharp),
            ),
          ),
          SizedBox(height: 25),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Forgot Password?"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: login,
              child: Text("LOGIN"),
            ),
          ),
        ],
      ),
    );
  }
}




//old code


// import 'package:flutter/material.dart';

// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.person_outline_rounded),
//                 labelText: "your email here",
//                 hintText: "email@gmail.com",
//                 border: OutlineInputBorder()),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           TextFormField(
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.person_outline_rounded),
//               labelText: "your password here",
//               hintText: "******************",
//               border: OutlineInputBorder(),
//               suffixIcon: Icon(Icons.remove_red_eye_sharp),
//             ),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: TextButton(
//               onPressed: () {},
//               child: Text("Forgot Password ?"),
//             ),
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 print("I have pressed the login button");
//               },
//               child: Text("LOGIN"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
