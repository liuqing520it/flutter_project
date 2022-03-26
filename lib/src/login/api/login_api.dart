import '../../../utils/networking/networking.dart';
import '../model/LoginModel.dart';

class LoginApi {
  ///发送验证码
  static sendCode(Map<String, dynamic> params, Function? onSuccess, Function onError){
    String uri = '/ml/user/sendMessages';
    // = {"countryCode": '86',"phone": "15210255865", "templateId":3};
    LQNetworking.postUrl(uri, params: params, onSuccess: (res){
      if(onSuccess != null){
        onSuccess(res);
      }
    }, onError: onError);
  }

  ///验证码登录
  static codeLogin(Map<String, dynamic> params, Function(UserModel userModel)? onSuccess, Function onError){
    String uri = '/ml/user/login/phone';
    LQNetworking.postUrl(uri, params: params, onSuccess: (){

    }, onError: onError);
  }
}