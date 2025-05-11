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
                "On Goinng Task",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextButton(onPressed: () {}, child: Text("See All")),
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
