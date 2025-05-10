import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.index});

  final int index;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isTaskCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      borderOnForeground: true,
      //color: ColorPallet.getCardColor(widget.index),
      color: Colors.white,
      child: SizedBox(
        height: 90,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleResize("Mobile Applicaton Design"),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                size: 20,
                                color: ColorPallet.primaryThemeColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "2h",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.flag_outlined,
                                size: 20,
                                color: ColorPallet.primaryThemeColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "9",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  side: BorderSide(color: ColorPallet.ornageAccent, width: 2),
                  checkColor: ColorPallet.pureWhite,
                  fillColor: WidgetStatePropertyAll(
                    isTaskCompleted == true
                        ? ColorPallet.primaryThemeColor
                        : null,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  value: isTaskCompleted,
                  onChanged: (val) {
                    setState(() {
                      if (val != null) isTaskCompleted = val;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String titleResize(String title) {
    if (title.length > 20) {
      return title = "${title.substring(0, 20)}...";
    }
    return title;
  }
}
