
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.amber,
      elevation: 5,
      shadowColor: Colors.grey,
      child: SizedBox(height: 80, width: double.maxFinite),
    );
  }
}
