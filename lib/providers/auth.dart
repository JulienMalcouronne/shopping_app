import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  static const params = {'key': 'AIzaSyCn7HDhcqH410kJZxkfv3Q2HTESeJ4v0v4n'};

  Future<void> signup(String email, String password) async {
    final url = Uri.https(
        'identitytoolkit.googleapis.com', '/v1/accounts:signUp', params);

    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
  }
}
