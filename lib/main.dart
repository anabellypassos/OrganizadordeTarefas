import 'package:flutter/material.dart';

void main() {
  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFC5CBFD),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seja bem vindo(a), \n  ao Meu \n Organizador de \n Tarefas',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontFamily: 'OpenSans', // Substitua pelo nome da sua fonte
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Espaço entre o texto e a imagem
            Image.asset(
              'assets/image/logo.png', // Caminho corrigido da sua imagem
              width: 200, // Largura da imagem
              height: 200, // Altura da imagem
            ),
          ],
        ),
      ),
    );
  }
}
