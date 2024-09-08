import 'package:flutter/material.dart';
import '../Utls/appBarCustom.dart';
class AdicionarTarefas extends StatefulWidget {
  const AdicionarTarefas({super.key});

  @override
  _AdicionarTarefasState createState() => _AdicionarTarefasState();
}

class _AdicionarTarefasState extends State<AdicionarTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefas'),
      ),
      body: const Center(
        child: Text('Conteúdo para adicionar tarefas'),
      ),
      bottomNavigationBar: const AppBarCustom(), // Usando o widget importado
    );
  }
}
