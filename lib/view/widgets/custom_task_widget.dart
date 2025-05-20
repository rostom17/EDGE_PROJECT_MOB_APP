import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/core/constants.dart';
import 'package:my_todo_list/view/widgets/custom_check_box.dart';

class CustomTaskWidget extends StatefulWidget {
  const CustomTaskWidget({super.key, required this.eachTask});

  final String eachTask;

  @override
  State<CustomTaskWidget> createState() => _CustomTaskWidgetState();
}

class _CustomTaskWidgetState extends State<CustomTaskWidget> {
  TaskStatus _status = TaskStatus.pending;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: Image.asset(getCategoryIcons(SubCategory.exercise)),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 16,
                  right: 16,
                  bottom: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reSizeTaskTitle("Task Title: ${widget.eachTask} "),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 75,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.clock,
                                size: 16,
                                color: ColorPallet.primaryTextColor.withAlpha(
                                  150,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '2h',
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          CupertinoIcons.flag,
                          size: 16,
                          color: ColorPallet.primaryTextColor.withAlpha(150),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '2h',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomCheckBox(
                status: _status,
                onChanged: (newStatus) {
                  setState(() {
                    _status = newStatus;
                  });
                },
              ),
            ],
          ),
        ),
        Divider(indent: 55, color: Colors.grey.shade200),
      ],
    );
  }

  String reSizeTaskTitle(String title) {
    if (title.length > 18) {
      return "${title.substring(0, 18)}...";
    }
    return title;
  }
}
