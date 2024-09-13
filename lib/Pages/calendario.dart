import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class Calendario extends StatelessWidget {
  const Calendario(String s, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('Compromissos'),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 60, 185, 235),
            Color.fromARGB(255, 227, 106, 249),
            Color.fromARGB(255, 247, 115, 225),
            Color.fromARGB(255, 144, 67, 238),
          ],
        ),
      ),
      body: EventCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: 'pt',
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY
      ),
      dayOptions: DayOptions(
        selectedTextColor: Colors.white,
        selectedBackgroundColor: Colors.purple[400]!
      ),
      events: [
        Event(
          child: const Text('test event'),
          dateTime: CalendarDateTime(
            year: 2024,
            month: 9,
            day: 12,
            calendarType: CalendarType.GREGORIAN,
            
          ),
        ),
      ],
    )
    );
  }
}
