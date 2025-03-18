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
      theme: _themeData(),

      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/BottomNavScreen", page: () => BottomNavScreen()),
      ],
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),

      navigationBarTheme: NavigationBarThemeData(
        height: 60,
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue,
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(color: Colors.grey[800], weight: 200, size: 30),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        surfaceTintColor: Colors.blueAccent,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        iconSize: 32,
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey[700],
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),

      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
      ),
    );
  }
}
