//Esse código Flutter cria uma tela de calendário interativa com a funcionalidade de adicionar eventos.

//Imports:

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

/* Classe Calendario:
A classe Calendario é um StatefulWidget, ou seja, sua interface pode mudar durante o tempo de execução.
O construtor do Calendario aceita dois parâmetros: uma string (que não está sendo utilizada) e um title obrigatório.*/
class Calendario extends StatefulWidget {
  const Calendario(String s, {super.key, required String title});

  @override
  CalendarioState createState() => CalendarioState();
}



/*Estado CalendarioState:
A classe CalendarioState é responsável por gerenciar o estado da tela de calendário. Ela contém:
_events: Uma lista de eventos (Event), que será usada para armazenar os eventos do calendário. */


class CalendarioState extends State<Calendario> {
  final List<Event> _events = [];


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
          
          // Container que exibe a lista de eventos
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
                                // Exibe o nome do evento
                                Text(
                                  (event.child as Text).data ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                // Exibe a data do evento
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
/*_onChangeDateTime:
Esta função é chamada sempre que o usuário muda a data no calendário. 
Ela recebe a data selecionada (CalendarDateTime dateTime) e chama _showAddEventDialog,
 que exibe um diálogo para adicionar um evento na data escolhida.*/

  void _onChangeDateTime(CalendarDateTime dateTime) {
    _showAddEventDialog(context, dateTime);
  }

/*Função _showAddEventDialog:
Esta função exibe uma caixa de diálogo para o usuário adicionar um evento. Ela faz o seguinte:

Cria um controlador de texto (eventController) para armazenar o nome do evento que o usuário digita.
showDialog: Exibe uma caixa de diálogo com um campo de texto e dois botões: Cancelar e Salvar.
Botão Cancelar: Fecha o diálogo sem salvar.
Botão Salvar: Verifica se o campo de texto não está vazio, e se não estiver, 
adiciona o evento à lista _events e fecha o diálogo.
 O evento adicionado contém um Text (o nome do evento) e a data selecionada.*/

  void _showAddEventDialog(
      BuildContext context, CalendarDateTime selectedDate) {
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
                  setState(() {
                    _events.add(
                      Event(
                        child: Text(eventName),
                        dateTime: selectedDate,
                      ),
                    );
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
            
            )
          ],
        );
      },
    );
  }
}
