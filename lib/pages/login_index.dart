import 'package:flutter/material.dart';
import 'package:project_5/services/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            // email
            TextFormField(
              controller: _emailTextController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'email adres'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vul emailadres in';
                }
                return null;
              },
            ),
            // password
            TextFormField(
              controller: _passwordTextController,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vul password in';
                }
                return null;
              },
            ),
            // submit button
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    final result = await AuthenticationServices.login(
                      _emailTextController.text,
                      _passwordTextController.text,
                    );
                  } catch (e) {}
                }
              },
              child: const Text('Inloggen'),
            ),
          ],
        ),
      ),
    );
  }

  void attemptLogin(String email, String password) async {
    bool loggedin = await AuthenticationServices.login(email, password);

    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: loggedin ? Text("Succesfully logged in") : Text("Login failed"),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    setState(() {});
  }
}