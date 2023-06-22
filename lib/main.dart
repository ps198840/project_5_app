import 'package:flutter/material.dart';
import 'package:project_5/pages/oefeningen_index.dart';
import 'package:project_5/pages/login_index.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_run_outlined)),
                Tab(icon: Icon(Icons.login)),
              ],
            ),
            title: const Text('Summa Actief'),
          ),
          body: const TabBarView(
            children: [
              OefeningenPage(),
              LoginPage();
            ],
          ),
        ),
      ),
    );
  }
}