import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/view/bottom_nav_page.dart';

class TaskWise extends StatelessWidget {
  const TaskWise({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavPage(),
    );
  }
}
