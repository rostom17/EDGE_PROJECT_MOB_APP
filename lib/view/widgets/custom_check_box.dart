import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';

enum TaskStatus { pending, done, failed }

class CustomCheckBox extends StatelessWidget {
  final TaskStatus status;
  final Function(TaskStatus) onChanged;

  const CustomCheckBox({
    super.key,
    required this.status,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    IconData? icon;
    Color fillColor;
    Color borderColor;
    Color iconColor;

    switch (status) {
      case TaskStatus.done:
        icon = Icons.check;
        fillColor = ColorPallet.primaryThemeColor;
        iconColor = Colors.white;
        borderColor = ColorPallet.primaryThemeColor;
        break;
      case TaskStatus.failed:
        icon = Icons.close;
        fillColor = ColorPallet.secondaryThemeColor;
        iconColor = Colors.white;
        borderColor = ColorPallet.secondaryThemeColor;
        break;
      default:
        icon = null;
        fillColor = Colors.transparent;
        iconColor = Colors.transparent;
        borderColor = Colors.grey;
        break;
    }

    return GestureDetector(
      onTap: () {
        TaskStatus newStatus;
        switch (status) {
          case TaskStatus.pending:
            newStatus = TaskStatus.done;
            break;
          case TaskStatus.done:
            newStatus = TaskStatus.failed;
            break;
          case TaskStatus.failed:
            newStatus = TaskStatus.pending;
            break;
        }
        onChanged(newStatus);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
          border: Border.all(color: borderColor, width: 2),
        ),
        child:
            icon != null
                ? Center(
                  child: Icon(icon, size: 18, color: iconColor, weight: 60),
                )
                : null,
      ),
    );
  }
}
