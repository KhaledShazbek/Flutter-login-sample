import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import './Welcome.dart';

class HttpMethods {
  var url = 'orderandtrack.000webhostapp.com';
  BuildContext _context;
  HttpMethods(this._context);

  void login(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    var res = await http.post(Uri.https(url, 'login.php'), body: data);
    if (jsonDecode(res.body) == 'found') {
      Navigator.push(
          _context, MaterialPageRoute(builder: (context) => Welcome()));
    } else {
      Fluttertoast.showToast(
          msg: jsonDecode(res.body), toastLength: Toast.LENGTH_SHORT);
    }
  }
}
