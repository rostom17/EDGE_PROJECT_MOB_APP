import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/pages/bottom_nav_page.dart';
import 'package:my_todo_list/view/pages/on_board_page.dart';

class TaskWise extends StatelessWidget {
  const TaskWise({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme(height, width),
      darkTheme: _darkTheme(),

      initialRoute: OnBoardPage.routeName,

      getPages: [
        GetPage(name: OnBoardPage.routeName, page: () => OnBoardPage()),
        GetPage(
          name: BottomNavigationPage.routeName,
          page: () => BottomNavigationPage(),
        ),
      ],
    );
  }

  ThemeData _darkTheme() {
    return ThemeData();
  }

  ThemeData _lightTheme(double height, double width) {
    return ThemeData(
      scaffoldBackgroundColor: ColorPallet.mainBackgroundColor,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),

      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: ColorPallet.primaryTextColor,
        ),

        titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorPallet.primaryTextColor,
        ),

        bodyLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: ColorPallet.primaryTextColor,
        ),

        bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: ColorPallet.secondaryTextColor,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallet.primaryThemeColor,
          foregroundColor: Colors.white,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorPallet.primaryThemeColor,
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorPallet.primaryThemeColor,
        foregroundColor: ColorPallet.pureWhite,

        // iconSize: 50
      ),
    );
  }
}
