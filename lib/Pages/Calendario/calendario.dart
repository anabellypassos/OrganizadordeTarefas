import 'package:flutter/material.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalendarioState();
  }
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário'),
      ),
      body: const Center(
        child: Text('Conteúdo do Calendário'),
      ),
    );
  }
}
