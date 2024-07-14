class Event {
  final String title;
  const Event(this.title);

  @override
  String toString() => title;
}

class EventosCalen {
  final Map<DateTime, List<Event>> _events = {};

  List<Event> getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void addEvent(DateTime day, Event event) {
    if (_events[day] == null) {
      _events[day] = [];
    }
    _events[day]!.add(event);
  }

  void removeEvent(DateTime day, Event event) {
    if (_events[day] != null) {
      _events[day]!.remove(event);
      if (_events[day]!.isEmpty) {
        _events.remove(day);
      }
    }
  }
}
