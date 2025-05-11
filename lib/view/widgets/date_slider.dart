import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/viewmodel/date_time_viewmodel.dart';

class DateSlider extends StatelessWidget {
  DateSlider({
    required this.noOfDays,
    required this.dayList,
    required this.selectedDate,
    super.key,
  });

  final int selectedDate;
  final int noOfDays;
  final List<String> dayList;

  final DateTimeViewmodel _dateTimeViewmodel = Get.find<DateTimeViewmodel>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              _dateTimeViewmodel.updateDate(index + 1);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12, left: index == 0 ? 12 : 0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                width: 50,
                decoration: BoxDecoration(
                  color:
                      index + 1 == selectedDate ? Colors.black87 : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color:
                            selectedDate == index + 1
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    Text(
                      dayList[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color:
                            selectedDate == index + 1
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

      itemCount: dayList.length,
    );
  }
}
