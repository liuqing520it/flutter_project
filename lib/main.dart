import 'package:flutter/material.dart';
import 'package:flutter_project/app_tab_nav/providers.dart';
import 'package:provider/provider.dart';
import '/app_tab_nav/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const App(),
    ),
  );
}
