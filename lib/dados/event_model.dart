class EventModel {
  final String name;
  final String date;

  EventModel({required this.name, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
    };
  }

  // Crie um método para criar um evento a partir de um Map
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      name: map['name'],
      date: map['date'],
    );
  }
}
