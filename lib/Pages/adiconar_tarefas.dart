import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import '../dados/tarefasDataBase.dart';
import '../dados/atrefasdatabase.dart';

class AdicionarTarefas extends StatefulWidget {
  const AdicionarTarefas({super.key});

  @override
  _AdicionarTarefasState createState() => _AdicionarTarefasState();
}

class _AdicionarTarefasState extends State<AdicionarTarefas> {
  final TextEditingController _nomeTarefaController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text('Adicionar Tarefas'),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 60, 185, 235),
            Color.fromARGB(255, 227, 106, 249),
            Color.fromARGB(255, 247, 115, 225),
            Color.fromARGB(255, 144, 67, 238),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 144, 67, 238),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nomeTarefaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome da tarefa',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.purple,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Descrição da tarefa',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.purple,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  maxLines: 5,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                final novaTarefa = Atrefasdatabase(
                  nametarefa: _nomeTarefaController.text,
                  descricao: _descricaoController.text,
                );

                await TarefaDatabase.instance.inserirTarefa(novaTarefa);

                // Envia de volta para a `HomePrincipal` com a confirmação de nova tarefa
                Navigator.pop(context, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
