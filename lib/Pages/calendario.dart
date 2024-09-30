import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import '../dados/event_model.dart';
import '../dados/databaseHelper .dart';

class Calendario extends StatefulWidget {
  const Calendario(String s, {super.key, required String title});

  @override
  CalendarioState createState() => CalendarioState();
}

class CalendarioState extends State<Calendario> {
  final List<Event> _events = [];
  late DatabaseHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper();
  }

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
      body: Column(
        children: [
          // Calendário
          Expanded(
            child: EventCalendar(
              calendarType: CalendarType.GREGORIAN,
              calendarLanguage: 'pt',
              calendarOptions: CalendarOptions(
                viewType: ViewType.DAILY,
              ),
              dayOptions: DayOptions(
                selectedTextColor: Colors.white,
                selectedBackgroundColor: Colors.purple[400]!,
              ),
              onChangeDateTime: _onChangeDateTime,
            ),
          ),
          // Lista de eventos
          Expanded(
            child: _events.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum evento adicionado.',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: _events.length,
                      itemBuilder: (context, index) {
                        final event = _events[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  (event.child as Text).data ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${event.dateTime.day}-${event.dateTime.month}-${event.dateTime.year}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  /// Função chamada ao mudar a data no calendário.
  void _onChangeDateTime(CalendarDateTime dateTime) {
    _loadEventsForSelectedDate(dateTime); // Carrega os eventos da data selecionada.
    _showAddEventDialog(context, dateTime); // Exibe o diálogo para adicionar um evento.
  }

  /// Carrega os eventos da data selecionada a partir do banco de dados.
  void _loadEventsForSelectedDate(CalendarDateTime dateTime) async {
    String selectedDate = '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    List<EventModel> eventsFromDB = await _dbHelper.getEventsByDate(selectedDate);

    setState(() {
      _events.clear();
      _events.addAll(
        eventsFromDB.map(
          (event) => Event(
            child: Text(event.name),
            dateTime: CalendarDateTime(
              year: dateTime.year,
              month: dateTime.month,
              day: dateTime.day, calendarType:EventCalendar.calendarType,
            ),
          ),
        ),
      );
    });
  }

  /// Exibe uma caixa de diálogo para adicionar um evento.
  void _showAddEventDialog(BuildContext context, CalendarDateTime selectedDate) {
    TextEditingController eventController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(92, 160, 11, 224),
          title: const Text(
            'Adicionar Evento',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: eventController,
            decoration: const InputDecoration(
              hintText: 'Digite o nome do evento',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                String eventName = eventController.text;
                if (eventName.isNotEmpty) {
                  _saveEventToDatabase(eventName, selectedDate); // Salva o evento no banco de dados
                }
                Navigator.of(context).pop();
              },
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Salva o evento no banco de dados e atualiza a lista de eventos.
  void _saveEventToDatabase(String eventName, CalendarDateTime selectedDate) async {
    String formattedDate = '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
    EventModel newEvent = EventModel(name: eventName, date: formattedDate);
    await _dbHelper.insertEvent(newEvent); // Insere o evento no banco de dados
    _loadEventsForSelectedDate(selectedDate); // Recarrega os eventos da data selecionada
  }
}
