import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/widgets/date_slider.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final double _containerHeight = 2400;
  DateTime _selectedDateTime = DateTime.now();
  int _daysInAMonth = 30;
  List<String> _dayNames = [];

  void onChangedDate(int day) {
    _selectedDateTime = DateTime(
      _selectedDateTime.year,
      _selectedDateTime.month,
      day,
      _selectedDateTime.hour,
      _selectedDateTime.minute,
      _selectedDateTime.second,
    );
    //print(_selectedDateTime);
  }

  void getDayNames(DateTime startDate, DateTime endDate) {
    List<String> names = [];
    DateFormat formatter = DateFormat('EEE');
    DateTime curDate = DateTime(startDate.year, startDate.month, startDate.day);

    while (curDate.isBefore(endDate) ||
        curDate.year == endDate.year &&
            curDate.month == endDate.month &&
            curDate.day == endDate.day) {
      names.add(formatter.format(curDate));
      curDate = curDate.add(const Duration(days: 1));
    }
    _dayNames = names;
  }

  void getDaysInMonth(DateTime dateTime) {
    DateTime firstDay = DateTime(dateTime.year, dateTime.month + 1, 1);
    DateTime lastDay = firstDay.subtract(const Duration(days: 1));
    _daysInAMonth = lastDay.day;

    DateTime startDate = DateTime(
      _selectedDateTime.year,
      _selectedDateTime.month,
      1,
    );
    DateTime endDate = DateTime(
      _selectedDateTime.year,
      _selectedDateTime.month,
      _daysInAMonth,
    );

    getDayNames(startDate, endDate);
  }

  void pickDate() async {
    var dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );
    if (dateTime != null) {
      _selectedDateTime = dateTime;
    }
    getDaysInMonth(_selectedDateTime);
    setState(() {});
  }

  @override
  void initState() {
    getDaysInMonth(_selectedDateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("@Today", style: Theme.of(context).textTheme.titleMedium),
            Text("12 May 2025", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 45,
              child: IconButton(
                onPressed: pickDate,
                icon: Image.asset("assets/icons/calendar.png"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: DateSlider(
                noOfDays: _daysInAMonth,
                dayList: _dayNames,
                selectedDate: _selectedDateTime.day,
                onChangedDate: onChangedDate,
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
