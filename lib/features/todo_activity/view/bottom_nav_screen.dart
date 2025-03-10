import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:my_todo_list/features/todo_activity/controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavController _bottomNavController =
      Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bottom nav bar")),
      bottomNavigationBar: GetBuilder<BottomNavController>(
        builder: (bldr) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: NavigationBar(
                backgroundColor: Colors.pink,
                elevation: 1,
                selectedIndex: _bottomNavController.currentIndex,
                //height: 75,
                onDestinationSelected: _bottomNavController.onChanged,

                destinations: [
                  NavigationDestination(
                    icon: Icon(Iconsax.home_outline),
                    label: "home",
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.calendar_tick_outline),
                    label: "Day View",
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.clock_outline),
                    label: "Focus",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
