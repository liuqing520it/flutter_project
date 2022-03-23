
class UserHelper {
  User user = User();

  UserHelper._internal();

  factory UserHelper() => _instance;

  static late final UserHelper _instance = UserHelper._internal();
}

class User{
  late final String userId;
  late final String avatar;
  late final String nickName;
  late final String token;
  // User({this.userId, this.nickName, this.avatar, this.token});
}