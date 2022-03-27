import 'package:flutter/material.dart';
import 'package:flutter_project/app_tab_nav/loading.dart';
import '../../app_tab_nav/app.dart';
import '../../src/login/code_login.dart';
import '../../src/profile/user_setting/user_setting.dart';
import '/src/login/send_code.dart';
import '/src/webview/LQWebView.dart';
import '/src/login/login_screen.dart';
import '/src/unknown/unknown_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    LoadingScreen.routeName: (_) => const LoadingScreen(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    SendCodeScreen.routeName: (_) => const SendCodeScreen(),
    CodeLoginScreen.routeName: (_) => const CodeLoginScreen(),
    LQWebView.routeName: (_) => const LQWebView(),
    AppMain.routeName: (_) => const AppMain(),
    UserSettingScreen.routeName: (_) => const UserSettingScreen(),
    LQUnknownScreen.routeName: (_) => const LQUnknownScreen(),
  };

  ///这里可以 做用户授权等操作, 如果用户未登录 弹出登录页面
  // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
  // 引导用户登录；其它情况则正常打开路由。

  // static final RouteFactory onGenerateRoute = (RouteSettings settings){
  //   if (settings.name == LQWebView.routeName) {
  //     return MaterialPageRoute(
  //         builder: (ctx) {
  //           Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
  //           return LQWebView(arguments: arguments);
  //         }
  //     );
  //   }
  //   return null;
  // };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) => const LQUnknownScreen());
  };
}
