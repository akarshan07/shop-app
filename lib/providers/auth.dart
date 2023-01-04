import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../modals/http_exception.dart';

class Auth with ChangeNotifier{

  String? _token;
  String? _userId;
  DateTime? _dateTime;


  Future<void> _authenticate(String email, String password, String urlSegment) async{

    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAAgvlf7aQ6LwaFLZrVUZszAPzizAeU_Ws');
    try{
      final response = await http.post(url,body: json.encode({
        'email':email,
        'password':password,
        'returnSecureToken':true,
      }));

      final responseData  =jsonDecode(response.body);
      if(responseData['error']!=null){
        throw HttpException(responseData['error']['message'].toString());
      }

    }catch(error){
      throw error;
    }

  }

  Future<void> signUp(String email,String password) async{

   return _authenticate(email, password, 'signUp');

  }

  Future<void> signIn( String email,String password ) async{

    return _authenticate(email, password, 'signInWithPassword');

  }

}
