import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// import 'pages/basics_example.dart';
// import 'pages/complex_example.dart';
// import 'pages/events_example.dart';
// import 'pages/multi_example.dart';
// import 'pages/range_example.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Clinic Booking')),
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                calendarFormat: format,
                //Daychange
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                  print(focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                // To style the calender
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 226, 255),
                      shape: BoxShape.circle),
                  selectedTextStyle: TextStyle(color: Colors.black),
                  todayDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 7, 226, 255),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  todayTextStyle: TextStyle(color: Colors.black),
                  // defaultDecoration: BoxDecoration(
                  //     color: Colors.blue,
                  //     shape: BoxShape.rectangle,
                  //     borderRadius: BorderRadius.circular(12))
                ),

                headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    headerPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
