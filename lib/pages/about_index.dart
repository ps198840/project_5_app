import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_5/services/authentication_service.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LicensePageCustom()));
            },
            child: Text('Licenties'),
          ),
        ),
      ),
    );
  }
}

class LicensePageCustom extends StatefulWidget {
  const LicensePageCustom({Key? key}) : super(key: key);

  @override
  State<LicensePageCustom> createState() => _LicensePageCustomState();
}

class _LicensePageCustomState extends State<LicensePageCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LicensePage(

      ),
    );
  }
}
