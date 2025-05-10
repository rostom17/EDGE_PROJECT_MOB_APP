import 'package:flutter/material.dart';

class OnboardSkipButton extends StatelessWidget {
  const OnboardSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.amber, Colors.orangeAccent]),
          boxShadow: [BoxShadow(color: Colors.amber.shade100, spreadRadius: 5)],
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          "Skip",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
