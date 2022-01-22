import'package:flutter/material.dart';
import 'package:movie/models/comments.dart';
import 'package:movie/screen_size.dart';
import 'package:movie/models/post.dart';
import 'package:movie/screens/components/commentComp.dart';
import 'package:movie/screens/components/postComponent.dart';
import 'package:movie/screens/login_screen.dart';
import 'package:movie/utilis/network.dart';
import 'package:movie/utilis/user_auth.dart';

class CommentScreen extends StatefulWidget {
  static const String id = 'comment';
  CommentScreen({this.post});

  final Post post;
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  List<Comments> _list = List<Comments>();
  bool load = true;



  getData()async{
    List<Comments> list = await NetworkUtilities.getComment(postId: widget.post.id);
    setState(() {
      _list = list;
      load = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
               Navigator.pushNamed(context,LoginScreen.id);

              }),
        ],
        title: Text('Social'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            PostComponent(postCom:widget.post),
            SizedBox(
              height: SizeConfig.safeBlockVertical*4,
            ),
            Center(child: Text('comments' ,style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal*3,
              color: Colors.black26
            ),), ),
            load ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
              ),
            ) : Container(
              child: ListView.builder(shrinkWrap:true,itemCount: _list.length,itemBuilder: (BuildContext cxt , int index){
                return CommentComp(comment: _list[index],);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
