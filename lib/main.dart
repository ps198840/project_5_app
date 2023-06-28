import 'package:flutter/material.dart';
import 'package:project_5/pages/about_index.dart';
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            bottom: const TabBar(
              indicatorColor: Colors.yellow,
              tabs: [
                Tab(icon: Icon(Icons.sports_martial_arts_rounded)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.book))
              ],
            ),
            title: const Text('Summa Actief'),
          ),
          body: TabBarView(
            children: [
              OefeningenPage(),
              LoginPage(),
              AboutPage(),
            ],
          ),
        ),
      ),
    );
  }
}