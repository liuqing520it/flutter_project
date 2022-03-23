

import 'dart:ui';

class LQSizeFit{
  ///当前设备的物理像素宽
  static double physicalWidth = window.physicalSize.width;
  ///当前设备的物理像素高
  static double physicalHeight = window.physicalSize.height;
  ///当前设备的逻辑像素
  static double dpr = window.devicePixelRatio;
  ///当前屏幕的宽度
  static double screenWidth = physicalWidth / dpr;
  ///当前屏幕的高度
  static double screenHeight = physicalHeight / dpr;
  ///当前状态栏高度
  static double statusHeight = window.padding.top;
  ///当前刘海屏底部的安全距离
  static double safeBottom = window.padding.bottom;
}