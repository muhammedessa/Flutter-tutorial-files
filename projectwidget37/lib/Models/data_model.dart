class DataModel{
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  String? image;

  DataModel( {this.id, this.firstName, this.lastName, this.maidenName, this.image});

  DataModel.fromJson(Map<String, dynamic> json ){
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    image = json['image'];
  }
}