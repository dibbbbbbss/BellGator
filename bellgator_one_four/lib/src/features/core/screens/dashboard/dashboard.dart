// import 'dart:convert';
// import '';
import 'package:bellgator_one_four/src/constants/color_strings.dart';
import 'package:bellgator_one_four/src/features/core/screens/profile/profile_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';

class MyDash extends StatefulWidget {
  @override
  _MyDashState createState() => _MyDashState();
}

class _MyDashState extends State<MyDash> {
  DateTime _selectedDate = DateTime.now();
  Map<String, List<Map<String, String>>> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2022-09-13": [
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-30": [
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-20": [
        {"eventTitle": "ss", "eventDescp": "ss"}
      ]
    };
  }

  List<Map<String, String>> _listOfDayEvents(DateTime dateTime) {
    final selectedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return mySelectedEvents[selectedDate] ?? [];
  }

  void _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              } else {
                setState(() {
                  final selectedDate =
                      DateFormat('yyyy-MM-dd').format(_selectedDate);
                  final newEvent = {
                    "eventTitle": titleController.text,
                    "eventDescp": descpController.text,
                  };

                  if (mySelectedEvents[selectedDate] != null) {
                    mySelectedEvents[selectedDate]!.add(newEvent);
                  } else {
                    mySelectedEvents[selectedDate] = [newEvent];
                  }
                });

                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldKoBackgroundColor,
      appBar: AppBar(
        backgroundColor: dashboardKoAppBarKoColor,
        leading: IconButton(
          onPressed: () {
            Get.to(ProfileScreen());
          },
          iconSize: 25,
          icon: Icon(
            Icons.person_2_rounded,
          ),
          color: profileButtonKoColor,
        ),
        actions: [
          Ink(
            decoration: const ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(color: Colors.green, width: 2),
                ),
                color: Colors.green),
            child: IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              icon: Icon(
                Icons.logout,
                color: logoutButtonColor,
                size: 25,
              ),
            ),
          )
        ],
        title: const Text(
          'Schedule',
          style: TextStyle(
            color: appbarTitleColorhehe,
          ),
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: SfCalendar(
              backgroundColor: calendarKoBackgroundColor,
              view: CalendarView.timelineDay,
              initialSelectedDate: _selectedDate,
              dataSource: _getCalendarDataSource(),
              monthViewSettings: const MonthViewSettings(showAgenda: true),
              onTap: (CalendarTapDetails details) {
                setState(() {
                  if (details.targetElement == CalendarElement.calendarCell) {
                    _selectedDate = details.date!;
                  }
                });
              },
            ),
          ),
          //     ..._listOfDayEvents(_selectedDate).map(
          //       (myEvent) => ListTile(
          //         leading: const Icon(
          //           Icons.done,
          //           color: Colors.green,
          //         ),
          //         title: Padding(
          //           padding: const EdgeInsets.only(bottom: 8.0),
          //           child: Text('Event Title: ${myEvent['eventTitle']}'),
          //         ),
          //         subtitle: Text('Description: ${myEvent['eventDescp']}'),
          //       ),
          //     ),
          //   ],
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: _listOfDayEvents(_selectedDate).length,
              itemBuilder: (context, index) {
                final myEvent = _listOfDayEvents(_selectedDate)[index];
                return ListTile(
                  leading: const Icon(
                    Icons.done,
                    color: Colors.red,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Event Title: ${myEvent['eventTitle']}'),
                  ),
                  subtitle: Text('Description: ${myEvent['eventDescp']}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: addScheduleButtonKoColor,
            onPressed: () => _showAddEventDialog(),
            label: const Text('Add Schedule'),
          ),
          SizedBox(height: 10),
          // FloatingActionButton.extended(
          //   onPressed: () {
          //     setState(() {
          //       _selectedDate = DateTime.now();
          //     });
          //   },
          //   label: const Text('Today'),
          //   elevation: 0,
          // ),
        ],
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    final List<Appointment> appointments = [];

    mySelectedEvents.forEach((date, events) {
      final DateTime dateTime = DateTime.parse(date);

      for (final event in events) {
        final String eventTitle = event['eventTitle'] ?? '';
        final String eventDescp = event['eventDescp'] ?? '';

        appointments.add(
          Appointment(
            startTime: dateTime,
            endTime: dateTime.add(const Duration(hours: 1)),
            subject: eventTitle,
            notes: eventDescp,
          ),
        );
      }
    });

    return _AppointmentDataSource(appointments);
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
