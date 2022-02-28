import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostRepo {
  Future<List<Post>> getPostsList() async {
    List<Post> listPost;

    String url = 'https://jsonplaceholder.typicode.com/posts';

    Map<String, String> header = {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List;
      listPost = list.map((i) => Post.fromJson(i)).toList();
    } else {
      listPost = [];
    }

    return listPost;
  }

  Future<Post> getPost({String? id}) async {
    Post post;

    String url = 'https://jsonplaceholder.typicode.com/posts/$id';

    Map<String, String> header = {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      post = Post.fromJson(json.decode(response.body));
    } else {
      post = Post();
    }

    return post;
  }
}
