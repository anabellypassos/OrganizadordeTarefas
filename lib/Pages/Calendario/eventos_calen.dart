import 'dart:collection';
import 'package:flutter/gestures.dart';
import 'package:table_calendar/table_calendar.dart' show isSameDay; // Ocultando o nome duplicado

class Event {
  final String title;

  Event(this.title);

  @override
  String toString() => title;
}

class EventosCalen {
  final LinkedHashMap<DateTime, List<Event>> events = LinkedHashMap(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  void addEvent(DateTime day, Event event) {
    if (events[day] == null) {
      events[day] = [];
    }
    events[day]!.add(event);
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
