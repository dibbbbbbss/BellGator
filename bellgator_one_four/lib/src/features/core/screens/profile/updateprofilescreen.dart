import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          'Edit Profile',
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
                      child: Image(
                        image: AssetImage("assets/images/splash.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("full name"),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("E-mail"), prefixIcon: Icon(Icons.email)),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Phone No"),
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Password"),
                          prefixIcon: Icon(Icons.fingerprint)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const UpdateProfileScreen()),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "joined ",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: "JUNE 2023",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("delete"),
                          style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(side: BorderSide.none),
                              elevation: 0,
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              foregroundColor: Colors.red),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
