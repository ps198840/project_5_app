import 'dart:convert';
import 'package:project_5/models/oefening.dart';
import 'package:http/http.dart' as http;

class AuthenticationServices {
  static const String _baseApi = 'http://10.244.17.94:8000/api';
  static String _bearerToken = '1|uLtEejDyZbADWvxnFBdy2s48j12Tow9RvJSND3RS';

  //API Get all
  static Future<List> getAll() async {
    final response = await http.get(
      Uri.parse('$_baseApi/oefeningen'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      throw Exception(
          'Fout bij het ophalen van alle oefeningen (${response.statusCode}).');
    }
    return jsonDecode(response.body);
  }

  //API delete
  static Future<bool> delete (String id) async {
    final response = await http.delete(
      Uri.parse('$_baseApi/oefeningen/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization' : 'Bearer $_bearerToken'
      },
    );

    return response.statusCode == 200;
  }

  //API register
  Future<bool> register (String email, String password, String name) async {
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
