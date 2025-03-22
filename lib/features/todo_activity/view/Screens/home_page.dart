import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_todo_list/features/todo_activity/view/Widgets/custom_appbar.dart';
import 'package:my_todo_list/features/todo_activity/view/Widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> names = ["rostom", "ali", "mehedi", "nagib", "ratan"];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppbar(
        title: "Homepage",
        leadingIcon: Iconsax.category_2,
        trailingIcon: Iconsax.notification,
        isDrawer: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 12, right: 16, left: 16),
          child: Column(
            children: [
              Container(
                height: screenHeight * .20,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.lightBlueAccent],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Task",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(onPressed: () {}, child: Text("See ALl")),
                ],
              ),
              const SizedBox(height: 12),
              ...listOfWidget(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/createTodoScreen");
        },
        child: Icon(Iconsax.add),
      ),
    );
  }

  List<Widget> listOfWidget(BuildContext context) {
    return names
        .map(
          (item) => Column(children: [const SizedBox(height: 8), CustomCard()]),
        )
        .toList();
  }
}
