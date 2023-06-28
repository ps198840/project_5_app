import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_5/services/authentication_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Registreren'),
      ),
      body: Center(
        child: ListView(
          children: [
            //name
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5.0 , horizontal: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'naam'
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vul naam in';
                }
                return null;
              },
            ),
          // email
          TextFormField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0 , horizontal: 10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: 'e-mail adres'
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vul emailadres in';
            }
            return null;
          },
        ),
        // password
        TextFormField(
          textInputAction: TextInputAction.next,
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0 , horizontal: 10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: 'wachtwoord'
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vul wachtwoord in';
            }
            return null;
          },
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0 , horizontal: 10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: 'herhaal wachtwoord'
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vul wachtwoord in';
            }
            return null;
          },
        ),
        // submit button
        Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.yellow,
                    )
                ),
                child: const Text('Registreren'),
                onPressed: () {
                },
              )
        ),
        ]
        ),
      ),
    );
  }
}
