import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/widgets/custom_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    Container(color: ColorPallet.scaffolBackgroundColor),
    Container(color: Colors.pink),
    Container(color: Colors.greenAccent),
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
