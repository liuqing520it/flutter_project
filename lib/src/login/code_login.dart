import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/utils/extension/int_extension.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/share/lq_colors.dart';
class CodeLoginScreen extends StatefulWidget {

  static String routeName = 'CodeLoginScreen';

  const CodeLoginScreen({Key? key}) : super(key: key);

  @override
  State<CodeLoginScreen> createState() => _CodeLoginScreenState();
}

class _CodeLoginScreenState extends State<CodeLoginScreen> {
  final _textEditingController = TextEditingController();
  final StreamController<ErrorAnimationType> _errorController = StreamController<ErrorAnimationType>();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          // fit: StackFit.loose,
          children: [

            Positioned(
              child: Image.asset(
                'assets/images/login/img_bj.png',
                width: 214.px,
                height: 292.px,
                fit: BoxFit.fill,
              ),
              right: 0,
              top: 0,
            ),
            ListView(
              children: [
                const SizedBox(height: 80),
                titleWidget(),
                inputWidget(),
              ],
            ),
            SizedBox(
              height: 180,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black)),
            ),
          ],
        ));
  }

  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('输入验证码',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: LQColors.text,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
          Text(
            '验证码已发送至手机',
            style: TextStyle(
                color: LQColors.text,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  ///输入框相关
  Widget inputWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 30.px, top: 100.px, right: 30.px),
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          inactiveFillColor:Colors.white,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          fieldHeight: 60,
          fieldWidth: 60,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        errorAnimationController: _errorController,
        controller: _textEditingController,
        onCompleted: (v) {
          print("Completed");
        },
        beforeTextPaste: (text) {
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        }, appContext: context,
        onChanged: (String value) {

        },
      ),
    );
  }
}

