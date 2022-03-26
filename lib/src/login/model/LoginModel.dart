
class UserModel{
  String? token;
  User? user;
  UserModel({this.token, this.user});
  UserModel.fromJson(Map<String, dynamic> json){
    token = json["token"];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User{
  int? assetManageId;
  String? assetManageName;
  int? message;
  String? nickName;
  String? phone;
  String? photo;
  int? userId;
  User({this.assetManageId, this.assetManageName, this.message, this.nickName, this.phone, this.photo, this.userId});
  User.fromJson(Map<String, dynamic> json) {
    assetManageId = json['assetManageId'];
    assetManageName = json['assetManageName'];
    message = json['message'];
    nickName = json['nickName'];
    phone = json['phone'];
    photo = json['photo'];
    userId = json['userId'];
  }
}