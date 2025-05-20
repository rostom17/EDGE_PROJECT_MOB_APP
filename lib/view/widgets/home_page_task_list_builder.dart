import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/widgets/custom_task_widget.dart';

class HomePageTaskListBuilder extends StatelessWidget {
  const HomePageTaskListBuilder({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: ColorPallet.pureWhite,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Task",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              DropdownButton(
                borderRadius: BorderRadius.circular(20),
                
                icon: Icon(Icons.menu),
                value: "Time",
                items: [
                  DropdownMenuItem(value: "Priority", child: Text("Priority")),
                  DropdownMenuItem(value: "Time", child: Text("Time")),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items
              .take(5)
              .map((eachTask) => CustomTaskWidget(eachTask: eachTask)),
        ],
      ),
    );
  }
}
