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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              leading: Icon(Icons.home_outlined, color: Color.fromARGB(255, 49, 49, 49)), 
              title: Text('Menu', style: TextStyle(color:Color.fromARGB(255, 49, 49, 49))),
            ),
            const ListTile(
              leading: Icon(Icons.date_range_outlined, color: Color.fromARGB(255, 49, 49, 49)), 
              title: Text('Calendário', style: TextStyle(color:Color.fromARGB(255, 49, 49, 49))),
            ),
            const ListTile(
              leading: Icon(Icons.view_agenda_outlined, color: Color.fromARGB(255, 49, 49, 49)), 
              title: Text('Agenda', style: TextStyle(color:Color.fromARGB(255, 49, 49, 49))),
            ),
            const ListTile(
              leading: Icon(Icons.wb_sunny_outlined, color: Color.fromARGB(255, 49, 49, 49)), 
              title: Text('Organizador diário', style: TextStyle(color:Color.fromARGB(255, 49, 49, 49))),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_today, color: Color.fromARGB(255, 49, 49, 49)),
              title: Text('Organizador semanal', style: TextStyle(color:Color.fromARGB(255, 49, 49, 49))),
            ),
            const ListTile(
              leading: Icon(Icons.assignment_outlined, color: Color.fromARGB(255, 49, 49, 49)), 
              title: Text('Anotações', style: TextStyle(color:Color.fromARGB(255, 49, 49, 49))),
            ),
            const Divider(),
            const SizedBox(height: 20),
            Image.asset('assets/image/nave.png'), // Ajuste o caminho da imagem conforme necessário
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFC5CBFD),
        child: Center(
          child: Image.asset('assets/image/menu.png',
          fit: BoxFit.contain, 
          ),
           
        ),
      ),
    );
  }
}
