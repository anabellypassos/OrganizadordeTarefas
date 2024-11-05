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

  title: Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Stack para o texto com borda
        Stack(
          children: [
            // Texto para a borda, ligeiramente maior
            Text(
              'Adicionar Tarefas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.black, // Cor da borda
              ),
            ),
            // Texto principal
            const Text(
              'Adicionar Tarefas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 241, 239, 241), // Cor do texto principal
              ),
            ),
          ],
        ),
        
        const SizedBox(width: 8), // Espaço entre o texto e a imagem

        // Imagem ao lado direito do texto
        SizedBox(
          
          width: 60,
          height: 60,
          child: Image.asset('assets/image/logo.png'),
        ),
      ],
    ),
  ),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 60, 185, 235),
            Color.fromARGB(255, 227, 106, 249),
            Color.fromARGB(255, 247, 115, 225),
            Color.fromARGB(255, 144, 67, 238),
          ],
        ),
      ),
        resizeToAvoidBottomInset: false,
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: 'Nome da tarefa',
                    hintStyle: const TextStyle(
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
           top: 270,
           right: 20,

            child:  ElevatedButton(
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
                    backgroundColor: const Color.fromARGB(255, 235, 99, 174),
                     elevation: 98, // Ajuste o valor para controlar a intensidade da sombra
                           shadowColor: Colors.grey.withOpacity(0.5), // Define a cor da sombra com opacidade
                  ),
           child: const Center(
             child: Row(
                      mainAxisSize: MainAxisSize.min,
                      
                      children: [
                        Text(
                          'Salvar',
                          style: TextStyle(
                            color: Colors.white,
                          fontSize: 20
                          
                          ),
                        ),
                       SizedBox(width: 8), // Espaço entre o texto e a imagem
                        Icon(
                          Icons.pets,
                          color: Colors.black,
                        ),
                        
                      ],
                    ),
           ),
         ),
         ),
          Positioned(
            
            bottom: 20,
            right: 0,
            left: 20,
            child: Column(
              children: [
                Image.asset('assets/image/ornizadordetarefas.png'),
               
              ],
            ),
          ),
        ],
      ),
     
    );
  }
}
