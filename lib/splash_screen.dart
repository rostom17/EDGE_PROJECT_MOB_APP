import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .5,
          child: Image.asset("assets/todo_icon.png"),
        ),
      ),
    );
  }
}
