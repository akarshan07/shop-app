import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier{

  String? _token;
  String? _userId;
  DateTime? _dateTime;

  Future<void> signUp(String email,String password) async{

    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAAgvlf7aQ6LwaFLZrVUZszAPzizAeU_Ws');
    final response = await http.post(url,body: json.encode({
      'email':email,
      'password':password,
      'returnSecureToken':true,
    }));

    print(json.decode(response.body));
  }

  Future<void> signIn( String email,String password ) async{

    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAAgvlf7aQ6LwaFLZrVUZszAPzizAeU_Ws');
    final response = await http.post(url,body: json.encode({
      'email':email,
      'password':password,
      'returnSecureToken':true,
    }));

    print(json.decode(response.body));
  }

}
