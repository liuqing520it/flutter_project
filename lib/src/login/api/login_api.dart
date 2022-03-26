import 'package:flutter_project/utils/configuration/configuration.dart';
import 'package:flutter_project/utils/user_helper/user_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/networking/networking.dart';
import '../model/LoginModel.dart';
import 'dart:convert';

class LoginApi {
  ///发送验证码
  static sendCode(
      Map<String, dynamic> params, Function? onSuccess, Function onError) {
    String uri = '/ml/user/sendMessages';
    // = {"countryCode": '86',"phone": "15210255865", "templateId":3};
    LQNetworking.postUrl(uri, params: params, onSuccess: (res) {
      if (onSuccess != null) {
        onSuccess(res);
      }
    }, onError: onError);
  }

  ///验证码登录
  static codeLogin(Map<String, dynamic> params,
      Function(UserModel userModel)? onSuccess, Function onError) {
    String uri = '/ml/user/login/phone';
    LQNetworking.postUrl(uri, params: params, onSuccess: (res) {
      UserModel temp = UserModel.fromJson(res["data"]);

      ///需要存储的值
      UserSaveModel saveModel = UserSaveModel(
          userId: temp.user?.userId,
          phone: temp.user?.phone,
          nickName: temp.user?.nickName,
          token: temp.token,
          avatar: temp.user?.photo);

      ///给单例赋值
      UserHelper().user = saveModel;

      ///将用户信息存储到内存, 下次进入程序直接从内存终端读取
      String userJsonString = json.encode(saveModel.toJson());
      saveUserInfo(userJsonString).then((value) => {
        if(value){
          if (onSuccess != null) {onSuccess(temp)}
        }
      }).catchError((e) {
        onError(e);
      });
    }, onError: onError);
  }

  static Future<bool> saveUserInfo(String userJsonString) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(Configuration.saveUserInfoKey, userJsonString);
  }
}
