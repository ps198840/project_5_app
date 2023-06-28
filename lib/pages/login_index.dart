import 'package:flutter/material.dart';
import 'package:project_5/services/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
var loginsucces = false;
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
              controller: _passwordTextController,
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
            // submit button
            Visibility(
              visible: !loginsucces,
              child: Container(
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
                    child: const Text('Login'),
                    onPressed: () {
                      attemptLogin(
                          _emailTextController.text, _passwordTextController.text);
                    },
                  )),
            ),
            Visibility(
              visible: loginsucces,
              child: Container(
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
                    child: const Text('Logout'),
                    onPressed: () {
                      attemptLogout();
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void attemptLogin(String email, String password) async {
    bool loggedin = await AuthenticationServices.login(email, password);
    loginsucces = loggedin;
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
  void attemptLogout() async {
    bool loggedout = await AuthenticationServices.logout();

    if (loginsucces && loggedout) {
      AlertDialog alert = AlertDialog(
        title: Text("Alert"),
        content: Text("Logged out"),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      loginsucces = false;
    }

    setState(() {});
  }
}