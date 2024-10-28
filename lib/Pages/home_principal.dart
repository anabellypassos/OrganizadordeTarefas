import 'package:flutter/material.dart';
import '../dados/atrefasdatabase.dart';
import '../Utls/checkboxApp.dart';
import '../dados/tarefasDataBase.dart';
import 'adiconar_tarefas.dart';

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

  Future<void> _excluirTarefa(int id) async {
    await TarefaDatabase.instance.excluirTarefa(id);
    _carregarTarefas();
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
                      leading: CheckboxExample(
                        tarefa: tarefa,
                        onChanged: (bool concluida) {
                          setState(() {
                            tarefa.concluida = concluida;
                          });
                          TarefaDatabase.instance.atualizarStatusTarefa(tarefa.id!, concluida);
                        },
                      ),
                      title: Text(
                        tarefa.nametarefa,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(tarefa.descricao),
                      trailing: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () {
                          _excluirTarefa(tarefa.id!);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novaTarefaAdicionada = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdicionarTarefas()),
          );
          if (novaTarefaAdicionada == true) {
            _carregarTarefas();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
