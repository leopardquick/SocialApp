import 'package:http/http.dart' as http;
import 'package:movie/models/comments.dart';
import 'dart:convert';

import 'package:movie/models/post.dart';
import 'package:movie/screens/components/postComponent.dart';
class NetworkUtilities{



  static Future getPost()async {
    List<Post> postList = [] ;
    final dynamic appId = "61eaa5e6d04207758694353e";
    http.Response postData =  await http.get('https://dummyapi.io/data/v1/post?limit=20',headers: {"app-id": appId});
    for (var posts in jsonDecode(postData.body)["data"]){
      postList.add(Post(
        id: posts['id'],
        image: posts['image'],
        likes: posts['likes'],
        text: posts['text'],
        tags: posts['tags'],
        publishDate: posts['publishDate'],
        owner: posts['owner'],

      ));
    }
    return postList;

  }

  static Future getComment({postId})async {

    List<Comments> commentList = [];

    final dynamic appId = "61eaa5e6d04207758694353e";
    String url = "https://dummyapi.io/data/v1/post/$postId/comment?limit=10";
    http.Response  postComment = await http.get(url,headers: {"app-id": appId});


    for(var comment in jsonDecode(postComment.body)["data"]){
        commentList.add(Comments(
          id: comment['id'],
          message: comment['message'],
          owner: comment['owner'],
          post: comment['post'],
          publishDate: comment['publishDate'],
        ));
    }

    return commentList;

  }

}