import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter/material.dart';
import 'app_view_data.dart';

class AppProviders {
  static List <SingleChildWidget>providers = [
    ChangeNotifierProvider(create: (_)=> AppViewData()),
    ChangeNotifierProvider(create: (_)=> TempModel()),
  ]; 
  
}

class TempModel with ChangeNotifier{
  int count = 0;
  updateCount(){
    count++;
    notifyListeners();
  }
}