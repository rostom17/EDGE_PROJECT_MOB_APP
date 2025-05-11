import 'package:flutter/material.dart';

import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/widgets/home_page_status_bar.dart';
import 'package:my_todo_list/view/widgets/home_page_task_list_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dummyTasks = [
    "Eat",
    "Bath",
    "Study",
    "Workout",
    "Gym",
    "Learn",
    "Versity",
  ];

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
            Text("Hey Rakib", style: Theme.of(context).textTheme.titleMedium),
            Text("May 5, 2025", style: Theme.of(context).textTheme.bodySmall),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: HomePageSatusBar(screenHeight: screenHeight),
            ),

            HomePageTaskListBuilder(items: dummyTasks),
            const SizedBox(height: 8),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
