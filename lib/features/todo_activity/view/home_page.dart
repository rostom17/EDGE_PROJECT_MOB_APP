import 'package:flutter/material.dart';
import 'package:my_todo_list/features/todo_activity/view/Widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Homepage",
        leadingIcon: Icons.menu,
        trailingIcon: Icons.notification_add_outlined,
      ),
    );
  }
}
