import 'package:flutter/material.dart';
import 'package:movie/models/comments.dart';
import 'package:movie/screen_size.dart';

class CommentComp extends StatelessWidget {
  CommentComp({
    this.comment
});
  final Comments comment ;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      margin: EdgeInsets.all(SizeConfig.blockSizeVertical*2),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeVertical*2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(comment.owner['picture']),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal*2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(comment.getFullname(),style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal*4
                    ),),
                    SizedBox(height: SizeConfig.safeBlockVertical*.5,),
                    Text(comment.publishDate,style: TextStyle(
                      color: Colors.black26,
                      fontSize: SizeConfig.safeBlockHorizontal*3,
                    ),),
                  ],
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical*2,),
            Text(comment.message,style: TextStyle(
              fontSize:  SizeConfig.safeBlockHorizontal*3.5,
            ),),
          ],
        ),
      ),
    );
  }
}
