import 'package:flutter/material.dart';
import 'package:flutter_project/utils/colors/lq_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '首页',
        style: TextStyle(color: LQColors.red, fontSize: 50),
      ),
    );
  }
}
