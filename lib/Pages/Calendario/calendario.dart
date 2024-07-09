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
        backgroundColor: const Color(0xFFC5CBFD),
        title: const Text(
          'Calendário',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
          ),
        ),
        centerTitle: true,
         iconTheme: const IconThemeData(
          color: Colors.white, 
        ), 
        elevation: 4.0, 
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFC5CBFD),
      ),
    );
  }
}
