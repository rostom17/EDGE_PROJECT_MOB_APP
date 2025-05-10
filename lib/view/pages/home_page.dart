import 'package:flutter/material.dart';

import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey Rakib", style: Theme.of(context).textTheme.displaySmall),
            Text("May 5, 2025", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: ColorPallet.primaryThemeColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.person_2_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildStatusBar(screenHeight),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "On Goinng Task",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  TextButton(onPressed: () {}, child: Text("See All")),
                ],
              ),
              const SizedBox(height: 8),

              ...List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TaskCard(index: index),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  SizedBox _buildStatusBar(double screenHeight) {
    return SizedBox(
      height: screenHeight * .25,
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorPallet.primaryThemeColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorPallet.ornageAccent.withAlpha(100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorPallet.secondaryThemeColor.withAlpha(100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
