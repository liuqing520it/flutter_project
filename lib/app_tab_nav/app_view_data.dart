
import 'package:flutter/cupertino.dart';

class AppViewData with ChangeNotifier{
  String? token;

  ///用户token更新通知 更新页面
  updateUserToken(String token){
    this.token = token;
    notifyListeners();
  }

}