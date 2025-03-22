import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/core/controller_bindings.dart';
import 'package:my_todo_list/features/todo_activity/view/Screens/bottom_nav_screen.dart';
import 'package:my_todo_list/features/todo_activity/view/Screens/create_todo_screen.dart';

import 'package:my_todo_list/features/todo_activity/view/Screens/splash_screen.dart';

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
        GetPage(name: "/createTodoScreen", page: () => CreateTodoScreen()),
      ],
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey.shade200,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.shifting,
        elevation: 4,
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

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
