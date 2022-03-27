import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/extension/int_extension.dart';
import 'package:flutter_project/utils/share/lq_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LQWebView extends StatefulWidget {
  static String routeName = 'LQWebView';

  // final Map<String, dynamic>? arguments;
  const LQWebView({Key? key}) : super(key: key);

  @override
  State<LQWebView> createState() => _LQWebViewState();
}

class _LQWebViewState extends State<LQWebView> {
  double _progress = 0;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments["title"]!, style: TextStyle(color: LQColors.text[800]),),
      ),
      body: Column(
        children: [
          // configProgressWidget(),
          Expanded(
            child: WebView(
              initialUrl: arguments["url"]!,
              javascriptMode: JavascriptMode.unrestricted,
              backgroundColor: Colors.white,
              onProgress: (progress){
                setState(() {
                  _progress = (progress as double);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget configProgressWidget(){
    if(_progress < 100.0){
      return LinearProgressIndicator(value:_progress, minHeight: 3.px,);
    }else{
      return const SizedBox(height: 1,);
    }
  }
}
