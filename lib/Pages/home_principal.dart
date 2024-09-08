import 'package:flutter/material.dart';
import '../../Utls/appbarCustom.dart';

class HomePrincipal extends StatelessWidget {
  const HomePrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minhas Tarefas',
          style: TextStyle(
            color: Colors.purple[800],
          ),
        ),
      ),
      bottomNavigationBar: const AppBarCustom(), // Usando o BottomNavigationBar diretamente
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromARGB(255, 60, 185, 235),
                Color.fromARGB(255, 227, 106, 249),
                Color.fromARGB(255, 247, 115, 225),
                Color.fromARGB(255, 144, 67, 238),
              ],
            ),
          ),
        ),
      ),
    );
  }
}