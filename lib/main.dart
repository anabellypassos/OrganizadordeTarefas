import 'package:flutter/material.dart';
import 'Utls/appBarCustom.dart';

void main() {
  runApp(const MyApp());
}

// Definição da classe MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const Appbarcustom(), // Corrigir aqui: Retorna a instância do widget
      },
    );
  }
}
