import 'package:flutter/material.dart';
import 'package:flutter_project/utils/colors/lq_colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(
      '个人中心',
      style: TextStyle(
        color: LQColors.red,
        fontSize: 30
      ),
    ),);
  }
}
