import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/core/controller_bindings.dart';
import 'package:my_todo_list/features/todo_activity/view/bottom_nav_screen.dart';

import 'package:my_todo_list/features/todo_activity/view/splash_screen.dart';

class MyTodoList extends StatelessWidget {
  const MyTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo List',
      initialBinding: ControllerBindings(),
      initialRoute: "/",
      theme: ThemeData(),
      themeMode: ThemeMode.dark,
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/BottomNavScreen", page: () => BottomNavScreen()),
      ],
    );
  }
}
