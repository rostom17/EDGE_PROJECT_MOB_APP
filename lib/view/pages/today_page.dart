import 'package:flutter/material.dart';
import 'package:my_todo_list/core/color_pallet.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  int selectedIndex = 1;
  final double containerHeight = 2400;

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
                onPressed: () {},
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
            SizedBox(height: 70, child: _buildCalenderDate()),
            const SizedBox(height: 20),
            Container(
              height: containerHeight,
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
                      height: (containerHeight - 20) / 24,
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

  ListView _buildCalenderDate() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index + 1;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12, left: index == 0 ? 12 : 0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                width: 50,
                decoration: BoxDecoration(
                  color:
                      index + 1 == selectedIndex
                          ? Colors.black87
                          : Colors.white,
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
                            selectedIndex == index + 1
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    Text(
                      'Wed',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color:
                            selectedIndex == index + 1
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

      itemCount: 30,
    );
  }
}
