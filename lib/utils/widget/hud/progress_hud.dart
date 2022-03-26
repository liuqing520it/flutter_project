import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LQProgressHud {
  static TransitionBuilder initProgress() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.clear
      ..dismissOnTap = false
      ..userInteractions = false
      ..radius = 12.0
      ..indicatorColor = Colors.white
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.black.withOpacity(0.5)
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..textColor = Colors.white
      ..displayDuration = const Duration(milliseconds: 1000)
      ..animationDuration = const Duration(milliseconds: 300);
    return EasyLoading.init();
  }

  ///loading
  static Future<void> show({String? title}) {
    return EasyLoading.show(status: title ?? 'loading...');
  }

  ///提示信息
  static Future<void> showInfo(String message) {
    return EasyLoading.showInfo(message);
  }

  ///成功信息
  static Future<void> showSuccess(String success) {
    return EasyLoading.showSuccess(success);
  }
  ///失败信息
  static Future<void> showError(String error) {
    return EasyLoading.showError(error);
  }
  ///吐司
  static Future<void> showToast(String toast){
    return EasyLoading.showToast(toast);
  }
  ///show进度信息
  static Future<void> showProgress(double progress, {String? message}){
    return EasyLoading.showProgress(progress, status:message);
  }

  static dismiss() {
    EasyLoading.dismiss();
  }


}