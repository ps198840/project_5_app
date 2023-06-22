import 'package:flutter/material.dart';

class OefeningenPage extends StatefulWidget {
  @override
  State<OefeningenPage> createState() => _OefeningenPageState();
}

class _OefeningenPageState extends State<OefeningenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Oefeningen Index'), actions: [
        IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.logout),
        ),
      ]),
      body: ListView(
        children: const [
          // Combobox met functies
          Text('Zet hier een combobox met alle functies'),
          // Lijst met employees
          SizedBox(height: 10,),
          Text('Zet hier een lijst met alle employees met deze functie'),
        ],
      ),
    );
  }
}
