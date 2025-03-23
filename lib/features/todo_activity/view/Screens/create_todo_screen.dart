import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_list/core/todo_category.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  int? _selectedCategoryIndex;

  void selectCategory(int idx) {
    setState(() {
      _selectedCategoryIndex = idx;
    });
  }

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
              _categoryItem(),
              const SizedBox(height: 12),
              Text(
                "Date & Time",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Start Time"),
                        const SizedBox(height: 12),
                        TextField(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("End Time"),
                        const SizedBox(height: 12),
                        TextField(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _categoryItem() {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...TodoCategory.values.map(
            (item) => Row(
              children: [
                InkWell(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  onTap: () {
                    selectCategory(item.index);
                  },
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color:
                        _selectedCategoryIndex != null &&
                                _selectedCategoryIndex == item.index
                            ? WidgetStatePropertyAll(Colors.green)
                            : null,
                    label: Text(item.name.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
