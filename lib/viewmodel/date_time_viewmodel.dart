import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeViewmodel extends GetxController {
  DateTime _selectedDateTime = DateTime.now();
  int _daysInAMonth = 30;
  List<String> _dayNames = [];

  DateTime get getDateTime => _selectedDateTime;
  int get getNoOfDaysInMonth => _daysInAMonth;
  List<String> get getDayNamesOfMonth => _dayNames;

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
    update();
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

    update();
  }

  void setNewDateTime(DateTime newDate) {
    _selectedDateTime = newDate;
    getDaysInMonth(_selectedDateTime);
    update();
  }

  void updateDate(int day) {
    _selectedDateTime = DateTime(
      _selectedDateTime.year,
      _selectedDateTime.month,
      day,
      _selectedDateTime.hour,
      _selectedDateTime.minute,
      _selectedDateTime.second,
      _selectedDateTime.millisecond,
      _selectedDateTime.microsecond,
    );
    update();
  }

  String get getMonthName {
    switch (_selectedDateTime.month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "Augast";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Invalid Month";
    }
  }

  String get dayMonthYearNameForAppbar {
    int day = _selectedDateTime.day;
    int year = _selectedDateTime.year;
    String month = getMonthName;
    return "$day $month $year";
  }

  String get getDayNameForAppbar {
    int day = _selectedDateTime.day;
    int month = _selectedDateTime.month;
    int year = _selectedDateTime.year;
    DateTime today = DateTime.now();

    if (year == today.year && month == today.month && day == today.day) {
      return "Today";
    } else {
      String name = getDayNamesOfMonth[day - 1];
      switch (name) {
        case "Sat":
          return "Saturday";
        case "Sun":
          return "Sunday";
        case "Mon":
          return "Monday";
        case "Tue":
          return "Tuesday";
        case "Wed":
          return "Wednesday";
        case "Thu":
          return "Thursday";
        default:
          return "Friday";
      }
    }
  }
}
