import 'package:flutter/material.dart';
import 'package:movie/screens/login_screen.dart';
import 'package:movie/screens/chat_screen.dart';


void main() async{
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        ChatScreen.id : (context) => ChatScreen()
      },
    );
  }
}
