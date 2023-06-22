import 'dart:convert';
import 'package:project_5/models/oefening.dart';
//import 'package:project_5/models/student.dart';
import 'package:http/http.dart' as http;

class AuthenticationServices {
  static const String _baseApi = 'http://127.0.0.1:8000/api';
  static String _bearerToken = '';

  //API Get all
  Future<List<Oefening>> getAll() async {
    List<Oefening> oefeningen = [];
    final response =
    await http.get(Uri.parse('http://127.0.0.1:8000/api/oefeningen'));

    if (response.statusCode != 200) {
      throw Exception(
          'Fout bij het ophalen van alle oefeningen (${response.statusCode}).');
    }

    final List<dynamic> data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      final oefening = Oefening(
          id: data[i]['id'],
          naam: data[i]['naam'],
          beschrijving: data[i]['beschrijving']);

          oefeningen.add(oefening);
    }
    return oefeningen;
  }

  //API register
  static Future<bool> register (String email, String password, String name) async {
    final response = await http.post(
      Uri.parse('$_baseApi/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation' : password
      }),
    );

    return response.statusCode == 200;
  }

  //API login
  static Future<bool> login (String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseApi/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );

    final result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      _bearerToken = result['access_token'];
    }

    return response.statusCode == 200;
  }

  //API logout
  static Future<bool> logout () async {
    final response = await http.post(
      Uri.parse('$_baseApi/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization' : 'Bearer $_bearerToken'
      },
    );

    return response.statusCode == 200;
  }
}
