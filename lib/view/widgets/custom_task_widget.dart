import 'package:flutter/material.dart';
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
          height: 80,
          width: double.maxFinite,
          child: Row(
            children: [
              CircleAvatar(child: Image.asset("assets/icons/goal.png")),

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
                      "Task Title: ${widget.eachTask}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    Text(
                      "Short Description of One Line",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    Row(children: [SizedBox()]),
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
}
