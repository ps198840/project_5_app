import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_5/services/authentication_service.dart';

class OefeningenPage extends StatefulWidget {
  const OefeningenPage({super.key});

  @override
  State<OefeningenPage> createState() => _OefeningenPageState();
}

class _OefeningenPageState extends State<OefeningenPage> {
  List<dynamic> oefeningen = [];
  @override
  void initState() {
    super.initState();
    getOefeningen();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: oefeningen.length,
        itemBuilder: (context, index) {
          final exercise = oefeningen[index];
          final name = exercise['naam'];
          final description = exercise['beschrijving'];
          return ListTile(
            title: Text(name),
            subtitle: Text(description),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getOefeningen,
        icon: const Icon(Icons.refresh),
        label: const Text('Vernieuwen'),
        backgroundColor: Colors.green,
      ),
    );
  }
  void getOefeningen() async {
    final Oefeningen = await AuthenticationServices.getAll();
    setState(() {
      oefeningen = Oefeningen;
    });
  }
}
