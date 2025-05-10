import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomOnboardPage extends StatelessWidget {
  const CustomOnboardPage({
    super.key,
    required this.title,
    required this.description,
    required this.lottieAnimationPath,
  });

  final String title;
  final String description;
  final String lottieAnimationPath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .55,
      width: double.maxFinite,
      child: Column(
        children: [
          Lottie.asset(lottieAnimationPath, repeat: true),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
