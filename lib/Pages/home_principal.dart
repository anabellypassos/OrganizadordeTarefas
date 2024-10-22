import 'package:flutter/material.dart';
import '../dados/atrefasdatabase.dart';
import 'adiconar_tarefas.dart';
import '../dados/tarefasDataBase.dart';
class HomePrincipal extends StatefulWidget {
  const HomePrincipal(String s, {super.key, required String title});

  @override
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  List<Atrefasdatabase> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {
    final tarefas = await TarefaDatabase.instance.buscarTarefas();
    setState(() {
      _tarefas = tarefas;
    });
  }

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromARGB(255, 60, 185, 235),
              Color.fromARGB(255, 227, 106, 249),
              Color.fromARGB(255, 247, 115, 225),
              Color.fromARGB(255, 144, 67, 238),
            ],
          ),
        ),
        child: _tarefas.isEmpty
            ? const Center(child: Text("Nenhuma tarefa salva."))
            : ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = _tarefas[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        tarefa.nametarefa,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(tarefa.descricao),
                    
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdicionarTarefas()),
          ).then((_) => _carregarTarefas()); // Recarrega as tarefas ao voltar
        },
        backgroundColor: Colors.purple[800],
        child: const Icon(Icons.add),
      ),
    );
  }
}
