import 'package:flutter/material.dart';
import '../src/login/login_screen.dart';
import '../src/unknown/unknown_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    LoginScreen.routeName : (BuildContext context)=> const LoginScreen(),
    LQUnknownScreen.routeName : (BuildContext context) => const LQUnknownScreen(),
  } ;

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) => const LQUnknownScreen());
  } ;
}

