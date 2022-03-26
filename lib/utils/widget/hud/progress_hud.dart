import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class LQProgressHud{
  ///一些初始化配置
  static TransitionBuilder initProgress(){
    SmartDialog.config
      ..alignment = Alignment.center
      ..isPenetrate = false
      ..clickBgDismiss = false
      ..maskColor = Colors.black.withOpacity(0.35)
      ..maskWidget = null
      ..animationDuration = const Duration(milliseconds: 250)
      ..isUseAnimation = true
      ..isLoading = true
      ..debounce = false
      ..debounceTime = const Duration(milliseconds: 300);
    return FlutterSmartDialog.init();
  }
  static final observer = FlutterSmartDialog.observer;


  ///loading
  static Future<void> showLoading({String? title}){
    return SmartDialog.showLoading(msg: title??'加载中...');
  }
  ///toast
  static Future<void> showMessage(String message){
    dismiss();
    return SmartDialog.showToast(message, consumeEvent: true, type: SmartToastType.first);
  }

  static dismiss(){
    SmartDialog.dismiss();
  }


}