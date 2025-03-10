import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bottom nav bar")),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        selectedIndex: 0,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: "Day View",
          ),
          NavigationDestination(icon: Icon(Icons.alarm), label: "Focus"),
        ],
      ),
    );
  }
}
