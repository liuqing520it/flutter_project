import 'package:flutter/material.dart';

class LQUnknownScreen extends StatelessWidget {
  static const String routeName = "/LQUnknownScreen";

  const LQUnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('错误页', style: TextStyle(color:Colors.white, fontSize: 18),),
      ),
      body: const Center(
        child: Text(
          '错误页面',
          style: TextStyle(color: Colors.red, fontSize: 34),
        ),
      ),
    );
  }
}
