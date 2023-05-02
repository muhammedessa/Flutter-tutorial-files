import 'dart:convert';

import '../models/post.dart';
import 'package:http/http.dart' as http;
class PostRepository{

  String postURL = 'https://jsonplaceholder.typicode.com/posts';

 Future<List<PostModel>> getPosts()async{
   http.Response response = await http.get(Uri.parse(postURL));
   if(response.statusCode == 200){
     final List result = jsonDecode(response.body);
     return result.map((e) => PostModel.fromJson(e)).toList();
   }else{
     throw Exception(response.reasonPhrase);
   }
  }

  Future<PostModel> getPostById( int id  ) async{
    var response = await http.get(Uri.parse('$postURL/$id'));
    var result = json.decode(response.body);
    PostModel post = PostModel.fromJson(result);
    return post;
  }


  Future<bool> createPost(PostModel post) async{
   var response = await http.post(
       Uri.parse(postURL),
     headers:{
       'Content-type': 'application/json; charset=UTF-8',
     },
     body: json.encode(post.toJson())
   );
   print('status code : ${response.statusCode}' );
   return response.statusCode == 200;
  }



Future<bool> updatePost(PostModel post) async{
  var response = await http.put(
      Uri.parse('$postURL/${post.id}'),
      headers:{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: json.encode(post.toJson())
  );
  print('status code : ${response.statusCode}' );
  return response.statusCode == 200;
}


  Future<bool> deletePost(int id) async{
    var response = await http.delete( Uri.parse('$postURL/$id'), );
    print('status code : ${response.statusCode}' );
    print('deleted id : $id' );
    return response.statusCode == 200;
  }




}