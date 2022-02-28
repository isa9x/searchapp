import 'package:dio/dio.dart';

import '../models/post.dart';

class PostRepo {
  Future<List<Post>> getPosts({String? id}) async {
    List<Post> listPost;

    String url = 'https://jsonplaceholder.typicode.com/posts';
    if (id != null || id != '') {
      url = url + '/$id';
    }
    var response = await Dio().get(url);

    var list = response.data as List;
    listPost = list.map((i) => Post.fromJson(i)).toList();

    return listPost;
  }
}
