import 'package:bellgator_one_four/src/features/core/syncfusion/insane.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Schedule Manager App",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu, color: Colors.white),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
            child: IconButton(
              onPressed: () => Get.to(ProfileScreen()),
              icon: Icon(Icons.person_2_sharp),
            ),
          )
        ],
      ),
      body: SafeArea(child: EventCalendar()),
    );
  }
}
