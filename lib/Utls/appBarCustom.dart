// ignore: file_names
import 'package:flutter/material.dart';
import '../Pages/home_principal.dart';
import '../Pages/calendario.dart';
import '../Pages/adiconar_tarefas.dart';

class Appbarcustom extends StatefulWidget {
  const Appbarcustom({super.key});

  @override
  _AppbarcustomState createState() => _AppbarcustomState();
}

class _AppbarcustomState extends State<Appbarcustom> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
   const HomePrincipal('Início', title: '',), 
    const Calendario('Calendário', title: ''),
    const AdicionarTarefas("Nova Tarefa")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Calendário",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: "Nova Tarefa",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
