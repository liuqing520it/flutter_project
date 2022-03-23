
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:Text('登录页', style: TextStyle(color: Colors.red, fontSize: 20),),
    );
  }
}
