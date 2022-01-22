import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/post.dart';
import 'package:movie/screen_size.dart';

class PostComponent extends StatelessWidget {

  PostComponent({this.postCom});

  final Post postCom;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*2),
      child: GestureDetector(
        child: Card(
          elevation: 23,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(postCom.owner["picture"]),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal* 2,
                    ),
                    Column(
                      children: [
                        Text(postCom.getFullname()),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical* 2,
                ),
                Row(
                  children: [
                    Container(
                      width: SizeConfig.safeBlockHorizontal*40 ,
                      height: SizeConfig.safeBlockVertical*20 ,
                      child: Image(
                        image: NetworkImage(postCom.image),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal* 1,
                    ),
                    Container(
                      width: SizeConfig.safeBlockHorizontal*40 ,
                      height: SizeConfig.safeBlockVertical*20 ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(postCom.text),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical* 2,
                          ),
                          Row(
                              children: <Widget>[
                                Icon(Icons.thumb_up ,size: SizeConfig.safeBlockHorizontal*7, color: Colors.lightBlueAccent,) ,
                                SizedBox(
                                  width: SizeConfig.safeBlockVertical* 2,
                                ),
                                Text(postCom.likes.toString(), style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal*3,
                                  color: Colors.lightBlueAccent
                                ),)
                              ]
                          )

                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
