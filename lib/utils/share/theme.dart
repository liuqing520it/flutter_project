import 'package:flutter/material.dart';
import '/utils/share/lq_colors.dart';

class AppTheme {
  ///主要主题
  static final appNormalTheme = ThemeData(
      /// 深色还是浅色 light/ dark
      brightness: Brightness.light,
      /// primarySwatch: 它是主题颜色的一个"样本色" 通过这个样本色可以在一些条件下生成一些其它的属性
      /// indicatorColor/primaryColor受影响
      primarySwatch: LQColors.theme,
      /// 主要颜色: 决定导航栏/TabBar的颜色
      primaryColor: LQColors.theme,
      /// 卡片颜色
      // cardColor:
      ///分割线颜色
      dividerColor: LQColors.gray,
      ///按钮主题
      buttonTheme: const ButtonThemeData(
        // minWidth:88,///最小宽度
        // height: 34, ///按钮高度
        textTheme: ButtonTextTheme.primary, //按钮文字样式
      ),
      ///应用程序 所有脚手架下背景色
      canvasColor: LQColors.gray[200],
      ///文字字体
      // fontFamily:
      ///字体主题，包括标题、body等文字样式
      textTheme: const TextTheme(
        titleSmall: TextStyle(fontSize: 12, color: Color(0xFF333333)),
        titleMedium: TextStyle(fontSize: 15, color: Color(0xFF333333)),
        titleLarge: TextStyle(fontSize: 18, color: Color(0xFF333333)),
      ));

  ///暗黑主题
  static final appDarkTheme = ThemeData(
      brightness:Brightness.dark,
      dividerColor: LQColors.gray[100],
  );
}
