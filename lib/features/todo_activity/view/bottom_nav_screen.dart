import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:my_todo_list/features/todo_activity/controller/bottom_nav_controller.dart';
import 'package:my_todo_list/features/todo_activity/view/day_activity_screen.dart';
import 'package:my_todo_list/features/todo_activity/view/focus_screen.dart';
import 'package:my_todo_list/features/todo_activity/view/home_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavController _bottomNavController =
      Get.find<BottomNavController>();

  final List<Widget> _screens = [
    HomePage(),
    DayActivityScreen(),
    FocusScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (bldr) {
        return Scaffold(
          body: _screens[_bottomNavController.currentIndex],
          bottomNavigationBar: _bottomNavBar(),
        );
      },
    );
  }

  Widget _bottomNavBar() {
    return NavigationBar(
      selectedIndex: _bottomNavController.currentIndex,
      onDestinationSelected: _bottomNavController.onChanged,
      destinations: [
        NavigationDestination(icon: Icon(Iconsax.home), label: "home"),
        NavigationDestination(
          icon: Icon(Iconsax.calendar_edit),
          label: "Day View",
        ),
        NavigationDestination(icon: Icon(Iconsax.clock), label: "Focus"),
      ],
    );
  }
}
