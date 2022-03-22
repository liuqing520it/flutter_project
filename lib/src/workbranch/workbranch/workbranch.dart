import 'package:flutter/material.dart';
import 'package:flutter_project/utils/colors/lq_colors.dart';

class Workbranch extends StatelessWidget {
  const Workbranch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '工作台',
        style: TextStyle(color: LQColors.text, fontSize: 35),
      ),
    );
  }
}
