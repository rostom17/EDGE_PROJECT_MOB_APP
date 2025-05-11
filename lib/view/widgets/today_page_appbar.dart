import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/viewmodel/date_time_viewmodel.dart';

class TodayPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  TodayPageAppBar({super.key});

  final DateTimeViewmodel _dateTimeViewmodel = Get.find<DateTimeViewmodel>();

  void pickDate(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );
    if (dateTime != null) {
      _dateTimeViewmodel.setNewDateTime(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: GetBuilder<DateTimeViewmodel>(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _dateTimeViewmodel.getDayNameForAppbar,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                _dateTimeViewmodel.dayMonthYearNameForAppbar,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
        },
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: SizedBox(
            width: 45,
            child: IconButton(
              //onPressed: pickDate,
              onPressed: () {
                pickDate(context);
              },
              icon: Image.asset("assets/icons/calendar.png"),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
