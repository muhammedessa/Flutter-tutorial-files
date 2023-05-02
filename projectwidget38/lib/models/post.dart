class PostModel{
  int? id;
  String? title;
  String? body;

  PostModel({this.id, this.title, this.body});
  PostModel.fromJson(Map<String, dynamic>json){
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String,dynamic> toJson()=>{
    PostFields.id: id,
    PostFields.title: title,
    PostFields.body: body,
  };
}

class PostFields{
  static final List<String> values = [id,body,title];
  static const String id = 'userId';
  static const String title = 'title';
  static const String body = 'body';

}