import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserAuth {



  static Future<dynamic> userLogin(email,password)async{
    final String uri = "https://reqres.in/api/login";
    http.Response response = await http.post(uri,body: {'email' : email , "password" : password });
    return jsonDecode(response.body);
  }

 static Future<void> saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<void> userLogOut()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

 static Future<bool> isAuthenticated()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   if(prefs.get('token') != null){
     return true;
   }else return false;
  }
}