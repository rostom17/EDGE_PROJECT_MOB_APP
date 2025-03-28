import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_todo_list/core/controller_bindings.dart';
import 'package:my_todo_list/features/authentication/view/login_screen.dart';
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
      initialRoute: "/loginScreen",
      theme: _themeData(),

      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/BottomNavScreen", page: () => BottomNavScreen()),
        GetPage(name: "/createTodoScreen", page: () => CreateTodoScreen()),
        GetPage(name: "/loginScreen", page: () => LoginScreen()),
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

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shadowColor: Colors.grey,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(color: Colors.blue),
          foregroundColor: Colors.black,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey[700],
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(color: Colors.black),
      ),

      dividerTheme: DividerThemeData(
        color: Colors.black,
        thickness: 2,
        endIndent: 10,
        indent: 10,
      ),

      textTheme: TextTheme(
        displayMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.grey[800],
        ),
        titleSmall: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
