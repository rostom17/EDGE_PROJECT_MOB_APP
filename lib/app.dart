import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/pages/home_page.dart';
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

      home: OnBoardPage(),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData();
  }

  ThemeData _lightTheme(double height, double width) {
    return ThemeData(
      scaffoldBackgroundColor: ColorPallet.mainBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallet.primaryThemeColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
