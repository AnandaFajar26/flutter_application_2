import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'login_screen.dart';
import 'home_screen.dart';
import 'profil_screen.dart';
import 'navigation_controller.dart';

class MainNavigationScreen extends StatelessWidget {
  final iconList = <IconData>[
    Icons.login,
    Icons.home,
    Icons.person,
    Icons.settings,
  ];

  final navController = Get.put(NavigationController());

  final pages = [
    LoginScreen(),
    HomeScreen(),
    ProfileScreen(),
    Center(child: Text('Pengaturan')),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            ['Login', 'Home', 'Profil', 'Pengaturan'][navController
                .currentIndex
                .value],
          ),
          actions: [
            if (navController.currentIndex.value == 1)
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () => navController.changeTab(2),
              ),
          ],
        ),
        body: pages[navController.currentIndex.value],
        floatingActionButton: FloatingActionButton(
          onPressed: () => navController.changeTab(1),
          child: Icon(Icons.nightlight_round),
          backgroundColor: Colors.orange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: navController.currentIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) => navController.changeTab(index),
          activeColor: Colors.orange,
          inactiveColor: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}