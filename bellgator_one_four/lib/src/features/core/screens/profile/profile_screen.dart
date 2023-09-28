import 'package:bellgator_one_four/src/features/core/screens/profile/profile_widget.dart';
import 'package:bellgator_one_four/src/features/core/screens/profile/updateprofilescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'profile',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          // children: [
                          Image(
                        image: AssetImage("assets/images/splash.png"),
                      ),
                      // ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green),
                        child: Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Text("profile heading",
                  style: Theme.of(context).textTheme.headline4),
              Text(
                "profile sub heading",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  child: Text("edit profile"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              //menu

              ProfileMenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {},
              ),
              ProfileMenuWidget(
                  title: "Billing Details", icon: Icons.wallet, onPress: () {}),

              ProfileMenuWidget(
                  title: "User Management",
                  icon: Icons.supervised_user_circle,
                  onPress: () {}),

              const Divider(color: Colors.grey),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "information",
                icon: Icons.info,
                onPress: () {},
              ),

              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout,
                onPress: () {},
                textColor: Colors.red,
                endIcon: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
