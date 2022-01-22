import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie/models/post.dart';
class NetworkUtilities{



  static Future getPost()async {
    List<Post> postList = [] ;
    final dynamic appId = "61eaa5e6d04207758694353e";
    http.Response postData =  await http.get('https://dummyapi.io/data/v1/post?limit=10',headers: {"app-id": appId});
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

}