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
    const HomePrincipal('Início', title: ''),
    const Calendario('Calendário', title: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _indiceAtual < 2 ? _telas[_indiceAtual] : null,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Item de navegação para Início
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.home_outlined),
                   iconSize: 30, 
                onPressed: () => onTabTapped(0),
              ),
            ),
            // Traço vertical
            Container(
              width: 1,
              height: 40,
              color: Colors.grey, // Cor do traço
            ),
            // Item de navegação para Calendário
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.calendar_month_outlined,),
                   iconSize: 30, 
                onPressed: () => onTabTapped(1),
              ),
            ),
          ],
        ),
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
    // Função para recarregar as tarefas, se necessário
  }
}
