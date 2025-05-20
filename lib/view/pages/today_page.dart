import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:my_todo_list/viewmodel/date_time_viewmodel.dart';
import 'package:my_todo_list/view/widgets/date_slider.dart';
import 'package:my_todo_list/view/widgets/today_page_appbar.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final DateTimeViewmodel _dateTimeViewmodel = Get.find<DateTimeViewmodel>();

  @override
  void initState() {
    _dateTimeViewmodel.getDaysInMonth(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodayPageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: GetBuilder<DateTimeViewmodel>(
                builder: (_) {
                  return DateSlider(
                    noOfDays: _dateTimeViewmodel.getNoOfDaysInMonth,
                    dayList: _dateTimeViewmodel.getDayNamesOfMonth,
                    selectedDate: _dateTimeViewmodel.getDateTime.day,
                  );
                },
              ),
            ),

            Container(
              height: 700,

              child: SfCalendar(
                cellBorderColor: Colors.red,
                cellEndPadding: 10,
                view: CalendarView.day,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
