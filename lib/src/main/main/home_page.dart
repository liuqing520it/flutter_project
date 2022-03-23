import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/src/unknown/unknown_screen.dart';
import '../../../share/lq_colors.dart';

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
              onPressed: () {
                Navigator.of(context).pushNamed(LQUnknownScreen.routeName);
              },
              child: const Text(
                '点击跳转',
                style: TextStyle(color: Colors.red, fontSize: 30),
              )),
        ],
      ),
    );
  }

  void _onPressPush() {}
}
