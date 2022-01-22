import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/constants.dart';
import 'package:movie/models/post.dart';
import 'package:movie/screen_size.dart';
import 'package:movie/utilis/network.dart';
import 'package:movie/utilis/user_auth.dart';
import 'package:movie/screens/components/postComponent.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  bool load = true;
  List<Post> _listPost = List<Post>();


  @override
  void initState() {
    super.initState();
    getData();
  }

  getData()async{
    print('get data start');
    List<Post> listPost = await NetworkUtilities.getPost();
    setState(() {
      _listPost = listPost;
      load = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async{
                UserAuth.userLogOut();
                Navigator.pop(context);

              }),
        ],
        title: Text('⚡️movie'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: load ? Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
          ),
        ) : Container(
          margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical*2),
          child: ListView.builder(itemCount: _listPost.length,itemBuilder: (BuildContext cxt , int index){
            return PostComponent(postCom: _listPost[index],);
          }),
        ),
      ),
    );
  }
}
