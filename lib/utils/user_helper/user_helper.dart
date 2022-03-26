class UserHelper {
  UserSaveModel? user;

  UserHelper._internal();

  factory UserHelper() => _instance;

  static late final UserHelper _instance = UserHelper._internal();
}

class UserSaveModel {
  int? userId;
  String? avatar;
  String? phone;
  String? nickName;
  String? token;

  UserSaveModel({this.userId, this.phone, this.nickName, this.avatar, this.token});

  UserSaveModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    avatar = json['avatar'];
    phone = json['phone'];
    nickName = json['nickName'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'avatar': avatar,
        'phone': phone,
        'nickName': nickName,
        'token': token,
      };
}
