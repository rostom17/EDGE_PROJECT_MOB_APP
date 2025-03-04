
import 'package:flutter/material.dart';
import 'package:my_todo_list/splash_screen.dart';

class MyTodoList extends StatelessWidget {
  const MyTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo List',
      home: SplashScreen(),
    );
  }
}