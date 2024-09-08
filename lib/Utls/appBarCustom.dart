import 'package:flutter/material.dart';
import '../Pages/adiconar_tarefas.dart';
import '../Pages/home_principal.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdicionarTarefas()),
          );
        }
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePrincipal()),
          );
        }
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePrincipal()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
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
    );
  }
}
