import 'package:flutter/material.dart';
import 'package:flutter_project/src/login/login_screen.dart';
import 'package:flutter_project/utils/configuration/configuration.dart';
import 'package:flutter_project/utils/user_helper/user_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/share/lq_colors.dart';

class UserSettingScreen extends StatefulWidget {
  static String routeName = '/UserSettingScreen';

  const UserSettingScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '设置',
          style: TextStyle(color: LQColors.text[800]),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        height: double.maxFinite,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '推送通知',
                  style: TextStyle(color: LQColors.text[800]),
                ),
                Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = true;
                      });
                    })
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            OutlinedButton(
              onPressed: () {
                onPressLogout();
              },
              child: const Text(
                '退出登录',
                style: TextStyle(color: LQColors.theme, fontSize: 16),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(250, 44)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22))),
                side: MaterialStateProperty.all(
                    const BorderSide(color: LQColors.theme,width: 0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<T?> onPressLogout<T>() {
    return (showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("您确定要退出登录吗?"),
            actions: <Widget>[
              TextButton(
                child: const Text("取消"),
                onPressed: () => Navigator.of(context).pop(), //关闭对话框
              ),
              TextButton(
                child: const Text("确定"),
                onPressed: () {
                  // ... 执行删除操作
                  userLogout();
                  Navigator.of(context).pop(true); //关闭对话框
                },
              ),
            ],
          );
        }));
  }

  ///用户退出登录
  userLogout() async {
    UserHelper().user = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(Configuration.saveUserInfoKey);
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,
        ModalRoute.withName(LoginScreen.routeName));
  }
}
