import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';

enum TaskStatus { pending, done, failed }

class CustomCheckBox extends StatefulWidget {
  final TaskStatus status;
  final Function(TaskStatus) onChanged;

  const CustomCheckBox({
    super.key,
    required this.status,
    required this.onChanged,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late TaskStatus _currentStatus;
  IconData? _currentIcon;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.status;
    _updateIcon();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.status != widget.status) {
      _currentStatus = widget.status;
      _delayedIconUpdate();
    }
  }

  void _updateIcon() {
    switch (_currentStatus) {
      case TaskStatus.done:
        _currentIcon = Icons.check;
        break;
      case TaskStatus.failed:
        _currentIcon = Icons.close;
        break;
      default:
        _currentIcon = null;
    }
  }

  void _delayedIconUpdate() async {
    _currentIcon = null;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 100));
    _updateIcon();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color fillColor;
    Color borderColor;
    Color iconColor;

    switch (_currentStatus) {
      case TaskStatus.done:
        fillColor = ColorPallet.primaryThemeColor;
        iconColor = Colors.white;
        borderColor = ColorPallet.primaryThemeColor;
        break;
      case TaskStatus.failed:
        fillColor = ColorPallet.secondaryThemeColor;
        iconColor = Colors.white;
        borderColor = ColorPallet.secondaryThemeColor;
        break;
      default:
        fillColor = Colors.transparent;
        iconColor = Colors.transparent;
        borderColor = Colors.grey;
        break;
    }

    return GestureDetector(
      onTap: () {
        TaskStatus newStatus;
        switch (_currentStatus) {
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

        widget.onChanged(newStatus); 
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
          border: Border.all(color: borderColor, width: 2),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child:
              _currentIcon != null
                  ? Icon(
                    _currentIcon,
                    key: ValueKey(_currentIcon),
                    size: 18,
                    color: iconColor,
                  )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
