import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app_tab_nav/providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/app_tab_nav/app.dart';

void main() {
  if(kDebugMode){
    ///这里是个测试代码 测试shared是否设置成功 每次在入口处设置会导致getString娶不到值!!!
    // SharedPreferences.setMockInitialValues({});
  }
  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const App(),
    ),
  );
}
