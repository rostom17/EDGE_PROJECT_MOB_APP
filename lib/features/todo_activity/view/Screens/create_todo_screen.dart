import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_list/core/todo_category.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crate New Task"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 12, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Task Name", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              TextField(),
              const SizedBox(height: 12),
              Text("Category", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...TodoCategory.values.map(
                      (item) => Row(
                        children: [
                          Chip(label: Text(item.name.toUpperCase())),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
