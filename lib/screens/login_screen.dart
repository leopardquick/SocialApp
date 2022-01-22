import 'package:movie/constants.dart';
import 'package:movie/screen_size.dart';
import 'package:movie/screens/chat_screen.dart';
import 'package:movie/screens/components/rounded_button.dart';
import 'package:movie/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:movie/utilis/user_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {

  String userEmail = '' ;
  String userPassword = '' ;
  String error  = '';
  bool show = true;

  void redirect()async{
    if(await UserAuth.isAuthenticated()){
      Navigator.pushNamed(context, ChatScreen.id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: SizeConfig.safeBlockVertical*10,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical*5,
            ),
          Container(
            child: Text(error, textAlign: TextAlign.center, style: TextStyle(
              color: Colors.red,
              fontSize: SizeConfig.safeBlockHorizontal*3
            ))
          ),
            SizedBox(
              height: SizeConfig.safeBlockVertical*5,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                userEmail = value ;
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical*3,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                userPassword = value ;
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter the password'),
            ),
            SizedBox(
              height: 24.0,
            ),
           RoundedButton(
             roundColor: Colors.lightBlueAccent,
             onClick: () async {
               setState(() {
                 error ='';
               });
              // Navigator.pushNamed(context, ChatScreen.id);
              dynamic response = await UserAuth.userLogin(userEmail.toLowerCase(), userPassword);
              if(response["error"] != null){
                 print(response["error"]);

                 setState(() {
                   error = response["error"];
                 });
              }else{
                print(response["token"]);
                await UserAuth.saveToken(response["token"]);
                Navigator.pushNamed(context, ChatScreen.id);
              }
             },
             text: 'Log in',
           ),
          ],
        ),
      ),
    );
  }
}
