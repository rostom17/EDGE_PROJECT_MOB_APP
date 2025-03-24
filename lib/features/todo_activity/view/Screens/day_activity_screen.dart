import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_list/features/todo_activity/view/Widgets/custom_appbar.dart';

class DayActivityScreen extends StatefulWidget {
  const DayActivityScreen({super.key});

  @override
  State<DayActivityScreen> createState() => _DayActivityScreenState();
}

class _DayActivityScreenState extends State<DayActivityScreen> {
  final List<DateTime> dates = List.generate(
    DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
    (index) => DateTime(DateTime.now().year, DateTime.now().month, index + 1),
  );

  int? _selectedDate;

  void _chooseDate(int idx) {
    setState(() {
      _selectedDate = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Today's Activiy",
        leadingIcon: Iconsax.calendar_add,
        trailingIcon: Iconsax.setting_4,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              Text(
                "22 March 2025",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: dates.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DateTime date = dates[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Text(
                            DateFormat('EEE').format(date), // Day (Mon, Tue)
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              _chooseDate(index);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    _selectedDate != null &&
                                            _selectedDate == index
                                        ? Colors.blueAccent
                                        : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "${date.day}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
