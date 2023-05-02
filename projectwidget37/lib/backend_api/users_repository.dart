import 'dart:convert';

import 'package:http/http.dart';
import 'package:projectwidget37/Models/data_model.dart';

class UserRepository{
  String usersUrl = 'https://dummyjson.com/users';

  Future<List<DataModel>> getUsers() async{
    Response response = await get(Uri.parse(usersUrl));

    if(response.statusCode == 200 ){
      final List result = jsonDecode(response.body)["users"];
      return result.map((e) => DataModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

}