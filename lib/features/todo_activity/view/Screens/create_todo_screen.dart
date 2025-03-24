import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 12, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Task Name", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              TextField(),
              const SizedBox(height: 12),
              Text("Category", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              _buildCategoryItem(),
              const SizedBox(height: 12),
              Text(
                "Date & Time",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(),
              const SizedBox(height: 12),
              _buildStartAndEndTime(),
              const SizedBox(height: 12),
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(maxLines: 3),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 25, left: 16, right: 16),
        child: ElevatedButton(onPressed: () {}, child: Text("Create Task")),
      ),
    );
  }

  Row _buildStartAndEndTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _startEndTime("Start Time"),
        const SizedBox(width: 12),
        _startEndTime("End Time"),
      ],
    );
  }

  Expanded _startEndTime(String time) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          TextField(),
        ],
      ),
    );
  }

  SizedBox _buildCategoryItem() {
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
                            ? WidgetStatePropertyAll(Colors.blue)
                            : WidgetStatePropertyAll(Colors.blue.shade100),
                    label: Text(
                      item.name.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            _selectedCategoryIndex != null &&
                                    _selectedCategoryIndex == item.index
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
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
