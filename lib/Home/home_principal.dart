import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: const Color(0xFFC5CBFD),
      ),
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFC5CBFD),
      ),
      
    );
  }
}
