import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/utils/networking/networking.dart';
import '../../../utils/share/lq_colors.dart';
import '/src/unknown/unknown_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          '首页',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '首页',
            style: TextStyle(color: LQColors.red, fontSize: 50),
          ),
          ElevatedButton(
              onPressed: () => {
                _onPressSend(context)
              },
              child: const Text(
                '发送验证码',
                style: TextStyle(color: Colors.red, fontSize: 30),
              )),
          ElevatedButton(
              onPressed: () => {
                _onPressPush(context)
              },
              child: const Text(
                '验证码登录',
                style: TextStyle(color: Colors.red, fontSize: 30),
              )),
        ],
      ),
    );
  }

  void _onPressSend(BuildContext context){
    String uri = '/ml/user/sendMessages';
    Map<String, dynamic> params = {"countryCode": '86',"phone": "15210255865", "templateId":3};
    LQNetworking.postUri(uri, params: params).then((value) =>
    {
    }).catchError((e){
    });
  }

  void _onPressPush(BuildContext context) {
    // Navigator.of(context).pushNamed(LQUnknownScreen.routeName);
    // var seqId = NetworkingConfig.configSequenceId();
    // var temp = NetworkingConfig.configCheckSum(seqId);
    String uri = '/ml/user/login/phone';
    Map<String, dynamic> params = {"verificationCode": '8888',"phone": "15210255865"};
    LQNetworking.postUri(uri, params: params).then((value) =>
    {
    }).catchError((e){
    });

  }
}
