import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/src/login/login_screen.dart';
import 'package:flutter_project/utils/configuration/configuration.dart';
import 'package:flutter_project/utils/user_helper/user_helper.dart';
import 'package:flutter_project/utils/widget/hud/progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

class LoadingScreen extends StatefulWidget {
  static String routeName = 'LoadingScreen';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _loadUserInfo().then((value) => {
      createRoute(value)
    }).catchError((e){
      LQProgressHud.showError(e);
    });
  }

  Future<SharedPreferences> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  createRoute(SharedPreferences prefs) {
    final String? userJson = prefs.getString(Configuration.saveUserInfoKey);
    print(userJson);
    String _userToken = '';
    if (userJson != null) {
      ///从内存中获取到了用户信息
      UserSaveModel userSaveModel =
          UserSaveModel.fromJson(json.decode(userJson));
      _userToken = userSaveModel.token!;
    }

    if (_userToken == "") {
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,
          ModalRoute.withName(LoginScreen.routeName));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, AppMain.routeName, ModalRoute.withName(AppMain.routeName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
