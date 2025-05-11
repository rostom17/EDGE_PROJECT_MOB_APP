import 'package:flutter/material.dart';

import 'package:my_todo_list/view/widgets/home_page_appbar.dart';
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
    return Scaffold(
      appBar: HomePageAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: HomePageSatusBar(),
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
