import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/core/viewmodel/date_time_viewmodel.dart';
import 'package:my_todo_list/view/widgets/date_slider.dart';
import 'package:my_todo_list/view/widgets/today_page_appbar.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final DateTimeViewmodel _dateTimeViewmodel = Get.find<DateTimeViewmodel>();
  final double _containerHeight = 2400;

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
            const SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorPallet.pureWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(24, (index) {
                    return SizedBox(
                      height: (_containerHeight - 20) / 24,
                      child: Text("${index + 1}"),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
