import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/utils/networking/networking.dart';
import '../../../utils/share/lq_colors.dart';
import '/src/unknown/unknown_screen.dart';
import '../../../app_tab_nav/app_view_data.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                _onPressSend()
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

  void _onPressSend(){
    Provider.of<AppViewData>(context, listen: false).updateUserToken(null);
  }

  void _onPressPush(BuildContext context) {


  }
}
