import 'package:flutter/material.dart';

class TodoViewScreen extends StatefulWidget {
  const TodoViewScreen({super.key});

  @override
  State<TodoViewScreen> createState() => _TodoViewScreenState();
}

class _TodoViewScreenState extends State<TodoViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo View Screen"),),
    );
  }
}