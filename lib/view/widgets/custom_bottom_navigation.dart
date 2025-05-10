import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onChangedIndex;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onChangedIndex,
  });

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: NavigationBar(
        height: 75,
        elevation: 5,
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),

        selectedIndex: widget.selectedIndex,
        onDestinationSelected: widget.onChangedIndex,

        destinations: [
          _buildNavigationItems(
            selectedIcon: "assets/icons/home filled.png",
            unselectedIcon: "assets/icons/home.png",
            itemIndex: 0,
            label: "Home",
          ),
          _buildNavigationItems(
            selectedIcon: "assets/icons/calendar filled.png",
            unselectedIcon: "assets/icons/calendar.png",
            itemIndex: 1,
            label: "Today",
          ),
          _buildNavigationItems(
            selectedIcon: "assets/icons/goal filled.png",
            unselectedIcon: "assets/icons/goal.png",
            itemIndex: 2,
            label: "Goal",
          ),
          _buildNavigationItems(
            selectedIcon: "assets/icons/alarm filled.png",
            unselectedIcon: "assets/icons/alarm.png",
            itemIndex: 3,
            label: "Timer",
          ),
        ],
      ),
    );
  }

  NavigationDestination _buildNavigationItems({
    required String selectedIcon,
    required String unselectedIcon,
    required int itemIndex,

    required String label,
  }) {
    return NavigationDestination(
      icon: Image.asset(
        widget.selectedIndex == itemIndex ? selectedIcon : unselectedIcon,
        height: 24,
        width: 24,
        color: widget.selectedIndex == itemIndex ? Colors.green : Colors.black,
      ),
      label: label,
    );
  }
}
