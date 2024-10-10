import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:path/path.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          color:  Color.fromARGB(255, 144, 67, 238),
        ),
        child: Center(
          
         child: SizedBox(
           child: Container(
              width: 300,
             child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder( ),
               
             hintText: 'Adicione a sua tarefa aqui:',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  
                ),
             fillColor: Colors.white,
             filled: true
              ),
              
              maxLines: 10,
             ),
           ),
         ),
       
        ),
      ),
      
    );
  }
}
