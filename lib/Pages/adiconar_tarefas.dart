import 'package:flutter/material.dart';
import '../Utls/appBarCustom.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

class AdicionarTarefas extends StatefulWidget {
  const AdicionarTarefas(String s, {super.key});

  @override
  _AdicionarTarefasState createState() => _AdicionarTarefasState();
}

class _AdicionarTarefasState extends State<AdicionarTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
      title: const  Text('Adicionar Tarefas'),
      gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 60, 185, 235),
                Color.fromARGB(255, 227, 106, 249),
                Color.fromARGB(255, 247, 115, 225),
                Color.fromARGB(255, 144, 67, 238),
              ],),
    ),
      body: const Center(
        child: Text('Conteúdo para adicionar tarefas'),
      ),
    );
  }
}
