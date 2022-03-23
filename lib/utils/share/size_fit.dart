

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
  ///屏幕适配所用到
  ///设计标准参照宽度 设计稿宽度
  static double standardWidth = 750;

  /// 不管是什么屏幕，统一分成 standardWidth 份
  /// 在iPhone5上：1rpx = 320/750 = 0.4266 ≈ 0.42px
  /// 在iPhone6上：1rpx = 375/750 = 0.5px
  /// 在iPhone6plus上：1rpx = 414/750 = 0.552px
  static double rpx = (screenWidth / standardWidth);
  static double px = (screenWidth / standardWidth * 2);

  static double setPx(double size){
    return px * size;
  }
  static double setRpx(double size){
    return rpx * size;
  }
}