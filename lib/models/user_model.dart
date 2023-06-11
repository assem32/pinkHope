
class UserModel{
  String ?name;
  String ?phone;
  String ?email;
  String ?uid;
  String ?role;
  UserModel({this.name,
    this.email,
    this.phone,
    this.uid,
    this.role,
}
      );
  UserModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uid=json['uid'];
    role=json['role'];

  }
  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,
      'role':role,

    };
  }
}