import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/utils/networking/networking.dart';

import '../model/user_profile.dart';

class ProfileApi{
  static loadUserInfo(Function(UserProfile user) onSuccess, Function onError){
    String uri = '/ml/user/detail';
    LQNetworking.postUrl(uri, onSuccess: (res){
      UserProfile userProfile = UserProfile.fromJson(res["data"]);
      if (kDebugMode) {
        print(userProfile);
      }
      onSuccess(userProfile);
      log(res.toString());
    }, onError: onError);
  }

}