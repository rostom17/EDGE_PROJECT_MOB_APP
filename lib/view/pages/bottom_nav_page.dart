import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/pages/home_page.dart';
import 'package:my_todo_list/view/pages/today_page.dart';
import 'package:my_todo_list/view/widgets/custom_bottom_navigation.dart';

class BottomNavigationPage extends StatefulWidget {
  static const routeName = "/homePage";
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    TodayPage(),
    Container(color: ColorPallet.secondaryThemeColor),
    Container(color: Colors.purple),
  ];

  void onChanged(int val) {
    setState(() {
      _selectedIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onChangedIndex: onChanged,
      ),
    );
  }
}
