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
    const Calendario('Calendário', title: '',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _indiceAtual < 2 ? _telas[_indiceAtual] : null, // Evita erro quando a index é 2
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

  void onTabTapped(int index) async {
    if (index == 2) {
      // Abre a tela `AdicionarTarefas` e espera o retorno
      final novaTarefaAdicionada = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdicionarTarefas()),
      );

      // Verifica se uma nova tarefa foi adicionada e recarrega as tarefas
      if (novaTarefaAdicionada == true) {
        _carregarTarefas();
      }
    } else {
      setState(() {
        _indiceAtual = index;
      });
    }
  }

  void _carregarTarefas() {
    
  }
}
